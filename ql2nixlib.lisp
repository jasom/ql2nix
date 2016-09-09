(defpackage ql2nix
  (:use :cl :split-sequence))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (named-readtables:find-readtable :cl-interpol)
    (named-readtables:defreadtable :cl-interpol
      (:merge :current)
      (:dispatch-macro-char #\# #\? #'interpol::interpol-reader))))

(in-package #:ql2nix)
(named-readtables:in-readtable :cl-interpol)


(defun compute-all-deps (system)
  (let* ((strategy (ql::compute-load-strategy system))
	 (ql-systems (slot-value strategy 'ql::quicklisp-systems))
	 (asdf-systems (slot-value strategy 'ql::asdf-systems))
	 (system-names))
    (loop for item = (pop asdf-systems)
       while item
       do (pushnew (slot-value item 'asdf/system::name) system-names :test #'equal)
       ;; TODO
	 (assert (null (slot-value item 'asdf/system::defsystem-depends-on)))
	 (loop for dep in (slot-value item 'asdf/system::depends-on)
	    for strategy = (ql::compute-load-strategy dep)
	    do
	      (setf ql-systems
		    (append (slot-value strategy 'ql::quicklisp-systems)
			    ql-systems)
		    asdf-systems
		    (append (slot-value strategy 'ql::asdf-systems)
			    asdf-systems))))
    (loop for item in ql-systems
	 do (pushnew (slot-value item 'ql::name) system-names))
    (remove system system-names :test #'equal)))

(defun ql-immediate-deps (package)
  (cdr (mapcar (lambda (x) (slot-value (if (listp x) (car x) x) 'ql::name)) (ql::dependency-tree package))))


(defun translate-system-name (system-name)
  (format nil "lisp-~A"
	  (substitute-if-not #\- #'alphanumericp (string-downcase system-name))))

(defun generate-nix-expr (name version url md5 system-deps foreign-deps foreign-inputs)
  #+(or)(assert (or (not (member "cffi" system-deps :test #'equal))
	      (not (null foreign-deps))))
  (let ((cl-interpol:*list-delimiter* ", ")
	(nix-system-deps (map 'list #'translate-system-name system-deps)))
    (concatenate
     'string
     #?|
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf@{(when foreign-deps '(", "))}@{foreign-deps}@{(when nix-system-deps '(", "))}@{nix-system-deps}, system ? builtins.currentSystem }:
|
     (let ((cl-interpol:*list-delimiter* " ")
	   (cl-interpol:*inner-delimiters* '((#\[ #\]))))
       #?|
let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf @[nix-system-deps] @[foreign-inputs] ];
      inherit stdenv;
      lisp_name = "sbcl-$[name]";
      LD_LIBRARY_PATH = "$[(format nil "~{${~A}/lib~^:~}" foreign-inputs)]";
      systemName = "$[name]";
      lisp_dependencies = "$[(format nil "~{${~A}~^ ~}" nix-system-deps)]";
      name = "$[name]$[version]";
      asdf="\${pkgs.asdf}";
      lisp = "\${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "$[url]";
        md5 = "$[md5]";
      };
    }
|))))

(defun get-release-from-system (system-name)
  (ql-dist:release (ql::find-system system-name)) )

(defun get-version-string (system-name)
  (with-slots ((project-name ql-dist::project-name)
	       (prefix ql-dist::prefix))
      (get-release-from-system system-name)
    (subseq prefix (length project-name))))

(defun get-archive-md5 (system-name)
  (slot-value (get-release-from-system system-name) 'ql-dist::archive-md5))

(defun get-archive-url (system-name)
  (slot-value (get-release-from-system system-name) 'ql-dist::archive-url))

(defun get-extra-deps (system-name &key deps inputs)
  (with-open-file  (f (merge-pathnames "extradeps.txt" cl-user::*script-pathname*))
    (loop for line = (read-line f nil nil)
       for (system dep input) = (and line (split-sequence #\Space line))
       while system
       when (equal system system-name)
       if deps collect dep
       else if inputs collect input)))

(defun main (system-to-load)
  (princ
   (generate-nix-expr system-to-load
		      (get-version-string system-to-load)
		      (get-archive-url system-to-load)
		      (get-archive-md5 system-to-load)
		      (ql-immediate-deps system-to-load)
		      (remove-duplicates (get-extra-deps system-to-load :deps t) :test #'equal)
		      (remove-duplicates (get-extra-deps system-to-load :inputs t) :test #'equal))))

;(format t "~{~A~%~}" (compute-all-deps *system-to-load*))
;(format t "~{~A~%~}" (main))
;(uiop:quit 0)
