(defpackage ql2nix
  (:use :cl :split-sequence :uiop))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (named-readtables:find-readtable :cl-interpol)
    (named-readtables:defreadtable :cl-interpol
      (:merge :current)
      (:dispatch-macro-char #\# #\? #'interpol::interpol-reader))))

(in-package #:ql2nix)
(named-readtables:in-readtable :cl-interpol)

(defvar *information-directory* nil)

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

(defvar *deps-hash* nil)

(defun ql-immediate-deps (package)
  (multiple-value-bind (result present)
      (gethash package *deps-hash*)
    (if present
	result
	(setf (gethash package *deps-hash*)
	      (cdr (mapcar (lambda (x) (slot-value (if (listp x) (car x) x) 'ql::name))
			   (ql::dependency-tree package)))))))

(defun translate-system-name (system-name)
  (format nil "lisp-~A"
	  (substitute-if-not #\- #'alphanumericp (string-downcase system-name))))

(defun generate-nix-expr (name version url md5 system-deps
			  foreign-deps foreign-inputs patches)
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
      systemName = "$[name]";
      patches = [@[patches]];
      lisp_dependencies = "$[(format nil "~{${~A}~^ ~}" nix-system-deps)]";
      name = "$[(subseq (translate-system-name name) 5)]$[version]";
      asdf="\${pkgs.asdf}";
      lisp = "\${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "$[url]";
        md5 = "$[md5]";
      };
    }
|))))

(defun system-release (system-name)
  (ql-dist:release (ql::find-system system-name)) )

(defun system-version-string (system-name)
  (with-slots ((project-name ql-dist::project-name)
	       (prefix ql-dist::prefix))
      (system-release system-name)
    (subseq prefix (length project-name))))

(defun system-archive-md5 (system-name)
  (slot-value (system-release system-name) 'ql-dist::archive-md5))

(defun system-archive-url (system-name)
  (slot-value (system-release system-name) 'ql-dist::archive-url))

(defun read-lines (filename)
  (with-open-file (f filename)
    (loop for line = (read-line f nil nil)
       while line collect line)))

(defun system-extra-deps (system-name &key deps inputs)
  (with-open-file  (f (merge-pathnames* "extradeps.txt" *information-directory*))
    (loop for line = (read-line f nil nil)
       for (system dep input) = (and line (split-sequence #\Space line))
       while system
       when (equal system system-name)
       if deps collect dep
       else if inputs collect input)))

(defvar *deps-hash-2* (make-hash-table :test #'equal))

(defun system-lisp-deps (system-name)
  (multiple-value-bind (result present)
      (gethash system-name *deps-hash-2*)
    (if present
	result
	(setf (gethash system-name *deps-hash-2*)
	      (remove-duplicates
	       (append (ql-immediate-deps system-name)
		       (and (probe-file (merge-pathnames* "extralispdeps.txt" *information-directory*))
		       (with-open-file  (f (merge-pathnames* "extralispdeps.txt" *information-directory*))
			 (loop for line = (read-line f nil nil)
			    for (system dep) = (and line (split-sequence #\Space line))
			    while system
			    when (equal system system-name)
			    collect dep)))))))))

(defun system-name (system)
  (if (stringp system)
      system
      (slot-value system 'ql::name)))

(defun blacklisted-system-p (system blacklist)
  (or (member system blacklist :test #'string=)
      (intersection (system-lisp-deps system) blacklist :test #'string=)))
  
(defun all-deps-in (system resolved)
  (not (set-difference 
	(system-lisp-deps system) resolved
	:test #'string=)))

(defun sort-ql-systems (initial-systems blacklist)
  (loop
     with result and last-completed-systems
     for systems = (copy-list initial-systems)
     then (loop
	     for system in systems
	     if (blacklisted-system-p system blacklist)
	       do (pushnew system blacklist :test #'string=)
	     else if (all-deps-in system result)
	       do (push system result)
	     else collect system)
     do (format t "~&~a systems resolved, ~a to go~%" (length result) (length systems))
     when (equal last-completed-systems systems)
     do
       (when systems
	 (format t "~%Unable to resolve dependencies for: ~{~%   ~A~}~%" systems))
       (return (nreverse result))
     do
       (setf last-completed-systems systems)))

(defun generate-build (input-directory output-directory systems)
  (generate-default-nix-file systems output-directory)
  (loop for system in systems
     do ;(format t "~&~A~%" system)
       (generate-nix-file system input-directory output-directory)))

(defun setup-output (indir outdir)
  (uiop:run-program `("rm" "-rf" ,(unix-namestring outdir)))
  (uiop:run-program `("mkdir" "-p" ,(unix-namestring outdir)))
  (uiop:run-program `("cp" "-a"
			   ,(unix-namestring (merge-pathnames* "lisp-builder" indir))
			   ,(unix-namestring (merge-pathnames* "patches" indir))
			   ,(unix-namestring outdir))))

(defun load-depcache (input-directory)
  (setf *deps-hash*
	(if (probe-file (merge-pathnames* "deps.sexp" input-directory))
	    (with-open-file (f (merge-pathnames* "deps.sexp" input-directory)
			       :direction :input)
	      (alexandria:plist-hash-table (read f) :test #'equal))
	    (make-hash-table :test #'equal))))

(defun save-depcache (input-directory &key replace)
  (ignore-errors
    (with-open-file (f (merge-pathnames* "deps.sexp" input-directory)
		       :direction :output
		       :if-exists (if replace :supersede :error))
      (print (alexandria:hash-table-plist *deps-hash*) f))))

(defun main (input-directory output-directory)
  (handler-bind
      ((t (lambda (c)
	    (terpri *error-output*)
	    (princ c *error-output*)
	    (terpri *error-output*)
	    (dissect:present c)
	    (uiop:quit 1))))
  (main2 input-directory output-directory)))

(defun main2 (input-directory output-directory)
  ;(trace fixup-rules)
  (load-depcache input-directory)
  (tagbody
   again
     (setup-output input-directory output-directory)
     (let*  ((*information-directory* input-directory)
	     (blacklisted-systems
	      (read-lines (merge-pathnames* "blacklist.txt" input-directory)))
	     (systems (sort-ql-systems
		       (map 'list #'system-name
			    (ql:system-apropos-list ""))
		       blacklisted-systems)))
       (save-depcache input-directory)
       (generate-build input-directory output-directory systems)
       (loop for system in systems
	    for progress from 0 by (/ (length systems))
	    for (_ error-output error-code) =
	    (multiple-value-list
	     (uiop:run-program `("nix-build"
				 "-A"
				 ,(translate-system-name system)
				 ,(uiop:unix-namestring output-directory))
			       :output t
			       :error-output :string
			       :ignore-error-status t))
	    do (write-sequence error-output *error-output*)
	       (format *error-output* "~%Progress: ~A~%" (float (* 100 progress)))
	    if (/= error-code 0)
	  do (fixup-rules system error-output)
	    (go again)))))
    

(defun generate-default-nix-file (systems output-directory)
  (with-open-file (outf (merge-pathnames* "default.nix"  output-directory)
			:direction :output
			:if-exists :supersede)
    (write-sequence
    (let ((cl-interpol:*list-delimiter* #?"\n")
	  (translated-names (map 'list #'translate-system-name systems)))
      #?|
{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  helpers = { buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl; };

  callPackage = pkgs.lib.callPackageWith (pkgs // helpers // self);

  self = {
  inherit pkgs;
    @((map 'list (lambda (x) #?"$(x) = callPackage ./$(x).nix { };") translated-names))

  };
in
  self
|) outf)))

(defvar *patch-list* nil)
(defun system-patches (system input-directory)
  (unless *patch-list*
    (setf *patch-list*
	  (split-sequence
	   #\Nul
	   (uiop:run-program
	    `("find" "." "-name" "*.patch" "-print0")
	    :directory input-directory
	    :output :string)))
    (format *error-output* "patch-list: ~a~%" *patch-list*))
  (remove-if-not
   (lambda (x)
     (alexandria:starts-with-subseq #?"./patches/${(translate-system-name system)}${(system-version-string system)}." x))
   *patch-list*))

(defun generate-nix-file (system-to-load input-directory output-directory)
  (with-open-file (outf (merge-pathnames* (format nil "~A.nix" (translate-system-name system-to-load)) output-directory)
			:direction :output
			:if-exists :supersede)
    ;(princ (pathname outf) *error-output*)
  (princ
   (generate-nix-expr system-to-load
		      (system-version-string system-to-load)
		      (system-archive-url system-to-load)
		      (system-archive-md5 system-to-load)
		      (system-lisp-deps system-to-load)
		      (remove-duplicates (system-extra-deps system-to-load :deps t) :test #'equal)
		      (remove-duplicates (system-extra-deps system-to-load :inputs t) :test #'equal)
		      (system-patches system-to-load input-directory)) outf)))

(defun ql-projects ()
  (ql::provided-releases t))

(defun release-systems (project whitelist)
  (let ((system-names (mapcar #'system-name (ql::provided-systems project))))
    (intersection system-names whitelist :test #'string=)))

(defmacro defmemoize (fn access-form args &body b)
  (alexandria:with-gensyms (result present)
    `(defun ,fn ,args
       (multiple-value-bind (,result ,present) ,access-form
	 (if ,present ,result
	     (setf ,access-form (progn ,@b)))))))

(defun blacklisted-release-p (release systems)
  (null (release-systems release systems)))

(defun all-release-deps-in (release set systems)
  (not (set-difference (project-deps release systems) set)))

(defun project-deps (project whitelist)
  (remove-duplicates
  (loop
     for system in (release-systems project whitelist)
     nconc (loop for dep in (system-lisp-deps system)
		collect (system-release dep)))))

(defun sort-releases (system-blacklist)
  (let ((systems (sort-ql-systems
		  (map 'list #'system-name
		       (ql:system-apropos-list ""))
		  system-blacklist)))
    (loop
       with result and last-completed-releases and blacklist
       for releases = (ql-projects)
       then (loop
	       for release in releases
	       if (blacklisted-release-p release systems)
	       do (pushnew release blacklist)
	       else if (all-release-deps-in release result systems)
	       do (push release result)
	       else collect release)
       do (format t "~&~a systems resolved, ~a to go~%" (length result) (length systems))
       when (equal last-completed-releases releases)
       do
	 (when releases
	   (format t "~%Unable to resolve dependencies for: ~{~%   ~A~}~%"
		   (map 'list
			(lambda (x)
			  (slot-value x 'ql-dist::project-name))
			releases)))
	 (return (nreverse result))
       do
	 (setf last-completed-releases releases))))

(defun append-to-input-file (fname line)
  (let ((path (merge-pathnames* fname *information-directory*)))
    (when (member line (read-lines path) :test #'string=)
      (error "Line: '~A' already present in '~A', this should not happen" line fname))
    (with-open-file (f path 
		       :direction :output
		       :if-exists :append)
      (format f "~A~%" line))))

(defun scan-group-one (regex string)
  (ignore-errors
    (elt (nth-value 1 (cl-ppcre:scan-to-strings regex string))
	 0)))

(defun library-test (string error-output)
  (cl-ppcre:scan
   #?/(?m)(Unable to load any of the alternatives:\n|Unable to load foreign library \([^\)]*\).\n|fatal error:)[^\n]*${string}/ 
		 error-output))

(defun library-add (system dep input)
  (append-to-input-file
   "extradeps.txt"
   #?"$(system) $(dep) $(input)"))

(defvar *library-info*
  (list
   "vorbisfile[.]h" "libvorbis" "libvorbis"
   "libsnappy[.\"-]" "snappy" "snappy"
   "libssl[.\"-]" "openssl" "openssl"
   "libsqlite3[.\"-]" "sqlite" "sqlite"
   "libsane[.\"-]" "sane-backends" "sane-backends"
   "libR[.\"-]" "R" "R"
   "libpcap[.\"-]" "libpcap" "libpcap"
   "libpapi[.\"-]" :blacklist :blacklist
   "libSDL_net[.\"-]" "SDL_net" "SDL_net"
   "libSDL_gfx[.\"-]" "SDL_gfx" "SDL_gfx"
   "libSDL_image[.\"-]" "SDL_image" "SDL_image"
   "libSDL_mixer[.\"-]" "SDL_mixer" "SDL_mixer"
   "libSDL[.\"-]" "SDL" "SDL"
   "libgslcblas[.\"-]" "gsl" "gsl"
   "libglpk[.\"-]" "glpk" "glpk"
   "libfann[.\"-]" :blacklist :blacklist
   "libsybdb[.\"-]" "freetds" "freetds"
   "libnet[.\"-]" "libnet" "libnet"
   "libgtk-x11[.\"-]" "gnome2" "gnome2.gtk"
   "libgvc[.\"-]" "graphviz" "graphviz"
   "libhspell[.\"-]" :blacklist :blacklist
   "libgtkglext[.\"-]" "gnome2" "gnome2.gtkglext"
   "libGLU[.\"-]" "mesa_glu" "mesa_glu"
   "libXrandr[.\"-]" "xorg" "xorg.libXrandr"
   "libX11[.\"-]" "xorg" "xorg.libX11"
   "libev[.\"-]" "libev" "libev"
   "libenchant[.\"-]" "enchant" "enchant"
   "libncursesw[.\"-]" "ncurses" "ncurses"
   "libassimp[.\"-]" "assimp" "assimp"
   "libtokyocabinet[.\"-]" "tokyocabinet" "tokyocabinet"
   "libtidy[.\"-]" "html-tidy" "html-tidy"
   "libtesseract[.\"-]" "tesseract" "tesseract"
   "libsoup[.\"-]" "gnome2" "gnome2.libsoup"
   "libslp[.\"-]" "openslp" "openslp"
   "librrd[.\"-]" "rrdtool" "rrdtool"
   "libreadline[.\"-]" "readline" "readline"
   "libproj[.\"-]" "proj" "proj"
   "libGL[.\"-]" "mesa" "mesa"
   "libopenal[.\"-]" "openal" "openal"
   "libmysqlclient_r[.\"-]" "libmysql" "libmysql"
   "libyaml[.\"-]" "libyaml" "libyaml"
   "libsvm[.\"-]" "libsvm" "libsvm"
   "libevent_openssl[.\"-]" "libevent" "libevent"
   "libkyotocabinet[.\"-]" "kyotocabinet" "kyotocabinet"
   "libpango-1[.\"-]" "pango" "pango"
   "libgirepository-1[.\"-]" "gobjectIntrospection" "gobjectIntrospection"
   "libgobject-2[.\"-]" "glib" "glib"
   "libftgl[.\"-]" "ftgl" "ftgl"
   "libgeos_c[.\"-]" "geos" "geos"
   "libGeoIP[.\"-]" "geoip" "geoip"
   "libfreeimage[.\"-]" "freeimage" "freeimage"
   "libfcgi[.\"-]" "fcgi" "fcgi"
   "libfbclient[.\"-]" "firebird" "firebird"
   "libIL[.\"-]" "libdevil" "libdevil"
   "libglib-2" "glib" "glib"
   "libhdf5" "hdf5" "hdf5"
   "libsophia" :blacklist :blacklist
   "libSOIL" :blacklist :blacklist
   "libRmath" :blacklist :blacklist
   "libplplotd" :blacklist :blacklist
   "libpuzzle" :blacklist :blacklist
   "liblinear" :blacklist :blacklist
   "libhoedown" :blacklist :blacklist
   "libode[.\"-]" :blacklist :blacklist))

(defun check-all-libs (system error-output)
  (loop for (libexpr dep input) on *library-info* by #'cdddr
     if (library-test libexpr error-output)
     if (eql dep :blacklist)
     do (format *error-output* "~%Blacklisting system due to it depending on ~A.~%" libexpr)
       (append-to-input-file "blacklist.txt" system)
       (return t)
     else
     do (library-add system dep input)
       (return t)))

(defun blacklist-system (system)
  (append-to-input-file "blacklist.txt" system))

(defun fixup-rules (system-name error-output)
  (cond
    ((check-all-libs system-name error-output))
    ((cl-ppcre:scan "Couldn't execute \"swig\": No such file or directory" error-output)
     (format *error-output* "~%Blacklisting package until I have a way to add custom hooks: ~A~%" system-name)
     (library-add system-name "swig" "swig"))
    ((cl-ppcre:scan "/usr/lib/R/" error-output)
     (format *error-output* "~%Blacklisting package until I have a way to add custom hooks: ~A~%" system-name)
     (blacklist-system system-name))
    ((cl-ppcre:scan "No qmake found" error-output)
     (format *error-output* "~%Blacklisting package due to be being too lazy to figure out why qmake doesn't work: ~A~%" system-name)
     (blacklist-system system-name))
     ;(library-add system-name "kde4" "kde4.qt4"))
    ((cl-ppcre:scan "fatal error: lfp.h: No such file or directory" error-output)
     (format *error-output* "~%Blacklisting package due to Nix's libfixposix being too old: ~A~%" system-name)
     (blacklist-system system-name))
    ((cl-ppcre:scan
      (format nil "Component \"~a\" not found" system-name) error-output)
     (format *error-output* "~%Blacklisting package due to 'component not found': ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((cl-ppcre:scan "curl: command not found" error-output)
     (format *error-output* "~%Blacklisting package due to it invoking curl during build; this can be fixed by patching the build process to not fetch from the internet: ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((cl-ppcre:scan "git: command not found" error-output)
     (format *error-output* "~%Blacklisting package due to it invoking git during build; this can be fixed by patching the build process to not fetch from the internet: ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((cl-ppcre:scan "#<DEFCONSTANT-UNEQL" error-output)
     (format *error-output* "~%Blacklisting package due to improper defconstant: ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((cl-ppcre:scan "Heap exhausted, game over" error-output)
     (format *error-output* "~%Blacklisting package due heap exhaustion: ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((cl-ppcre:scan "invalid ELF header." error-output)
     (format *error-output* "~%Blacklisting package due to it appearing to be 32-bit only: ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((cl-ppcre:scan "#<TYPE-ERROR expected-type:" error-output)
     (format *error-output* "~%Blacklisting package due to type error: ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((cl-ppcre:scan "conflicts with its asserted type" error-output)
     (format *error-output* "~%Blacklisting package due to type error: ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((cl-ppcre:scan "/homeless-shelter/" error-output)
     (format *error-output* "~%Blacklisting package due to it accessing home directory ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((cl-ppcre:scan "conflicting with its asserted type" error-output)
     (format *error-output* "~%Blacklisting package due to type warning: ~A~%" system-name)
     (append-to-input-file "blacklist.txt" system-name))
    ((let ((pkg (scan-group-one "required by #<SYSTEM \"([^\"]+)\">" error-output)))
       (and pkg
	    (not (member pkg (system-lisp-deps system-name) :test #'equalp))))
     (append-to-input-file
      "extralispdeps.txt"
      (format nil "~A ~A"
	      system-name
	      (scan-group-one "required by #<SYSTEM \"([^\"]+)\">" error-output))))
    ((cl-ppcre:scan "#<PACKAGE-INFERRED-SYSTEM" error-output)
     (append-to-input-file
      "extralispdeps.txt"
      (format nil "~A ~A"
	      system-name
	      (elt (nth-value 1 (cl-ppcre:scan-to-strings
				 "Component \"([^\"]+)\" not found"
				 error-output))
		   0))))
    ((cl-ppcre:scan "Component ([^ ]+) not found" error-output)
     (append-to-input-file
      "extralispdeps.txt"
      (let ((groups (nth-value 1 (cl-ppcre:scan-to-strings "Component ([^: ]*:([^ ]*)|\"([^\"]+)\") not found" error-output))))
	(format nil "~A ~A"
		system-name
		(string-downcase
		 (or (elt groups 1) (elt groups 2)))))))
    (t (format *error-output* "~%Unable to fixup system ~A~%" system-name)
       (uiop:quit 1))))
       
