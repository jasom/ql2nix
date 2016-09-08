(defpackage ql2nix
  (:use :cl))

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
  system-names))

(defun ql-immediate-deps (package)
  (cdr (mapcar (lambda (x) (slot-value (if (listp x) (car x) x) 'ql::name)) (ql::dependency-tree package))))


(defun generate-nix-expr (name version url md5 project-deps system-deps foreign-deps)
  (concatenate
   'string
   (let ((cl-interpol:*list-delimiter* ","))
     #?|
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, @{foreign-deps} @{project-deps} system ? builtins.currentSystem }:
|)
   (let ((cl-interpol:*list-delimiter* " ")
	 (cl-interpol:*inner-delimiters* '((#\[ #\]))))
    #?|
let
  pkgs = import <nixpkgs> [ inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage [
      propagatedBuildInputs = [ sbcl @[project-deps] @[foreign-deps] ];
      inherit stdenv;
      lisp_name = "sbcl-$[name]";
      systemName = "$[name]";
      lisp_dependencies = "$[(format nil "~{${{~A}}~^ ~}" system-deps)]";
      name = "$[name]-$[version]";
      asdf="\${pkgs.asdf}";
      lisp = "\${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl [
        url = "$[url]";
        md5 = "$[md5]";
      ];
    ]
|)))

(defun main (project-to-load)
  (let ((all-systems (ql-dist:provided-systems (ql-dist:dist "quicklisp")))
	(deps))

    (loop for system in all-systems
       for system-name = (slot-value system 'ql-dist::name)
       for release = (slot-value system 'ql-dist::release)
       for project-name = (slot-value release 'ql-dist::project-name)
       when (equal project-name project-to-load)
       do (setf deps (union (ql-immediate-deps system-name) deps :test #'equal)))
    deps))
;(format t "~{~A~%~}" (compute-all-deps *system-to-load*))
(format t "~{~A~%~}" (deps))
(uiop:quit 0)
