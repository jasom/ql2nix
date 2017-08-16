(uiop:define-package ql2nix
  (:mix :cl :split-sequence :uiop :alexandria))

(declaim (optimize (debug 3) (speed 0)))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (named-readtables:find-readtable :cl-interpol)
    (named-readtables:defreadtable :cl-interpol
      (:merge :current)
      (:dispatch-macro-char #\# #\? #'interpol::interpol-reader))))

(in-package #:ql2nix)

(defvar *nix-build-output*)
(named-readtables:in-readtable :cl-interpol)

(defmacro defmemoize (fn access-form args &body b)
  (alexandria:with-gensyms (result present)
    `(defun ,fn ,args
       (multiple-value-bind (,result ,present) ,access-form
	 (if ,present ,result
	     (setf ,access-form (progn ,@b)))))))

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

(defmemoize ql-immediate-deps
    (gethash package *deps-hash*)
    (package)
  (cdr (mapcar (lambda (x) (slot-value (if (listp x) (car x) x) 'ql::name))
	       (ql::dependency-tree package))))

#|
(defun ql-immediate-deps (package)
  (multiple-value-bind (result present)
      (gethash package *deps-hash*)
    (if present
	result
	(setf (gethash package *deps-hash*)
	      (cdr (mapcar (lambda (x) (slot-value (if (listp x) (car x) x) 'ql::name))
			   (ql::dependency-tree package)))))))
|#

(defun translate-system-name (system-name)
  (format nil "lisp-~A"
	  (substitute-if-not #\- #'alphanumericp (string-downcase system-name))))

(defun translate-project-name (project-name)
  (format nil "lisp-project-~A"
	  (substitute-if-not #\- #'alphanumericp (string-downcase project-name))))

(defun comma-list (list)
  (when list
    (append list '(" "))))

(defun generate-nix-expr (name version system-deps foreign-deps foreign-inputs patches
			  lisp-implementations)
  #+(or)(assert (or (not (member "cffi" system-deps :test #'equal))
	      (not (null foreign-deps))))
  (let ((cl-interpol:*list-delimiter* ", ")
	(nix-system-deps (map 'list #'translate-system-name system-deps))
	(nix-project-name (translate-project-name (release-name (system-release name)))))
    (concatenate
     'string
     #?|
{ buildLispPackage, stdenv, fetchurl, ${nix-project-name}, 
  @{(comma-list foreign-deps)} @{(comma-list nix-system-deps)}
  @{(comma-list lisp-implementations)}
  system ? builtins.currentSystem }:
|
     (let ((cl-interpol:*list-delimiter* " ")
	   (cl-interpol:*inner-delimiters* '((#\[ #\]))))
       #?|
let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ @[nix-system-deps] @[foreign-inputs] ];
      inherit stdenv;
      systemName = "$[name]";
      @[(when (system-nobundle-p name) (list "NoBundle = 1;"))]
      sourceProject = "\${$[nix-project-name]}";
      patches = [@[patches]];
      lisp_dependencies = "$[(format nil "~{${~A}~^ ~}" nix-system-deps)]";
      name = "$[(subseq (translate-system-name name) 5)]$[version]";
      #lisp = "\${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ $[(format nil "~{\"${pkgs.~A}\"~^ ~}" lisp-implementations)] ];
    }
|))))

(defun generate-release-nix-file (release input-directory output-directory)
  (with-open-file (outf (merge-pathnames* (format nil "~A.nix" (translate-project-name (release-name release))) output-directory)
			:direction :output
			:if-exists :supersede)
    ;(princ (pathname outf) *error-output*)
  (princ
   (generate-release-nix-expr (release-name release)
			      (release-version-string release)
			      (release-archive-url release)
			      (release-archive-md5 release)
			      (release-patches release input-directory))
   outf)))

(defun generate-release-nix-expr (name version url md5 patches)
  (let ((cl-interpol:*list-delimiter* " ")
	(cl-interpol:*inner-delimiters* '((#\[ #\]))))
    #?|
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [@[patches]];
      name = "$[(subseq (translate-system-name name) 5)]$[version]";
      src = pkgs.fetchurl {
        url = "$[url]";
        md5 = "$[md5]";
      };
    }
|))


(defun release-version-string (release)
  (with-slots ((project-name ql-dist::project-name)
	       (prefix ql-dist::prefix))
      release
    (subseq prefix (length project-name))))

(defun release-archive-md5 (release)
  (slot-value release 'ql-dist::archive-md5))

(defun release-archive-url (release)
  (slot-value release 'ql-dist::archive-url))

(defun release-name (release)
  (slot-value release 'ql-dist::project-name))

(defparameter *system-release-hash* (make-hash-table :test #'equal))

(defmemoize system-release (gethash system-name *system-release-hash*) (system-name)
  (ql-dist:release (ql::find-system system-name)))

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
  (when (probe-file filename)
    (read-file-lines filename)))

(defun write-lines (filename lines)
  (with-open-file (f filename
		     :direction :output
		     :if-exists :supersede)
    (format f "~{~A~%~}" lines)))

(defun release-extra-deps (release whitelist &key deps inputs)
  (remove-duplicates
   (mapcan (lambda (x) (system-extra-deps x :deps deps :inputs inputs))
   (release-systems release whitelist))))

(defvar *nobundles* nil)

(defun system-nobundle-p (system-name)
  (unless *nobundles*
    (setf *nobundles*
	  (read-lines (merge-pathnames* "nobundle.txt" *information-directory*))))
  (member system-name *nobundles* :test #'string=))

(defun system-extra-deps (system-name &key deps inputs)
  (loop for line in (read-lines (merge-pathnames* "extradeps.txt" *information-directory*))
     for (system dep input) = (and line (split-sequence #\Space line))
     while system
     when (equal system system-name)
     if deps collect dep
     else if inputs collect input))

(defun system-lisp-deps (system-name)
  (remove-if (lambda (x) (member x '("asdf" "uiop") :test #'string=))
  (remove-duplicates
   (append (ql-immediate-deps system-name)
	   (and (probe-file (merge-pathnames* "extralispdeps.txt" *information-directory*))
		(with-open-file  (f (merge-pathnames* "extralispdeps.txt" *information-directory*))
		  (loop for line = (read-line f nil nil)
		     for (system dep) = (and line (split-sequence #\Space line))
		     while system
		     when (equal system system-name)
		     collect dep))))
   :test #'string=)))

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

(defun all-releases (systems)
  (loop with result
       for system in systems
       do (pushnew (system-release system) result :key #'release-name :test #'string=)
       finally (return result)))

(defun generate-build (input-directory output-directory systems)
  (let ((releases (all-releases systems)))
    (generate-default-nix-file systems releases output-directory)
    (loop for system in systems
       do ;(format t "~&~A~%" system)
	 (generate-nix-file system input-directory output-directory))
    (loop
       for release in releases
       do (generate-release-nix-file release input-directory output-directory))))

(defun setup-output (indir outdir)
  (uiop:run-program `("rm" "-rf" ,(unix-namestring outdir)))
  (uiop:run-program `("mkdir" "-p" ,(unix-namestring outdir)))
  (uiop:run-program `("cp" "-a"
			   ,(unix-namestring (merge-pathnames* "lisp-builder" indir))
			   ,(unix-namestring (merge-pathnames* "patches" indir))
			   ,(unix-namestring outdir))))

(defun main (input-directory output-directory skip)
  (handler-bind
      ((t (lambda (c)
	    (terpri *error-output*)
	    (princ c *error-output*)
	    (terpri *error-output*)
	    (dissect:present c)
	    (uiop:quit 1))))
  (main2 input-directory output-directory skip)))

(defun main2 (input-directory output-directory skip)
  ;(trace fixup-rules)
  (load-depcache input-directory)
  (let (completed-systems)
    (tagbody
     again
       (setup-output input-directory output-directory)
       (let*  ((*information-directory* input-directory)
	       (blacklisted-systems
		(map 'list
		     (lambda (x) (car (split-sequence #\Space x)))
		     (read-lines (merge-pathnames* "blacklist.txt" input-directory))))
	       (all-systems (sort-ql-systems
			 (map 'list #'system-name
			      (ql:system-apropos-list ""))
			 blacklisted-systems))
	       (systems
		(progn
		  (when (and skip (not completed-systems))
		    (setf completed-systems (subseq all-systems 0 skip)
			  skip nil))
		(remove-if
			 (lambda (x) (member x completed-systems :test #'string=))
			 all-systems))))
	 (save-depcache input-directory)
	 (generate-build input-directory output-directory all-systems)
	 (loop for system in systems
	    for progress = (/ (length completed-systems) (length all-systems))
	    for (_ *nix-build-output* error-code) =
	      (multiple-value-list
	       (uiop:run-program `("nix-build"
				   "--option" "use-binary-caches" "false"
				   "-A" ,(translate-system-name system)
				   ,(uiop:unix-namestring output-directory))
				 :output t
				 :error-output :string
				 :ignore-error-status t))
	    do (write-sequence *nix-build-output* *error-output*)
	      (format *error-output* "~&Progress: ~A (~A%)~%" (length completed-systems) (float (* 100 progress)))
	    if (/= error-code 0)
	    do (fixup-rules system)
	       (go again)
	    else do
            (format *error-output* "~&Successfully completed ~A~%" system)
            (push system completed-systems))))))


(defun generate-default-nix-file (systems projects output-directory)
  (with-open-file (outf (merge-pathnames* "default.nix"  output-directory)
			:direction :output
			:if-exists :supersede)
    (write-sequence
    (let ((cl-interpol:*list-delimiter* #?"\n")
	  (translated-names (map 'list #'translate-system-name systems))
	  (translated-project-names (map 'list
					 (lambda (x) (translate-project-name
						      (release-name x)))
					 projects)))
      #?|
{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  helpers = {
       buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
       buildLispProject = pkgs.callPackage ./lisp-builder/project.nix pkgs.sbcl;
  };

  callPackage = pkgs.lib.callPackageWith (pkgs // helpers // self);

  self = {
  inherit pkgs;
    @((map 'list (lambda (x) #?"$(x) = callPackage ./$(x).nix { };") translated-names))
    @((map 'list (lambda (x) #?"$(x) = callPackage ./$(x).nix { };") translated-project-names))

  };
in
  self
|) outf)))

(defvar *patch-list* nil)

(defun release-patches (release input-directory)
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
     (alexandria:starts-with-subseq #?"./patches/${(translate-project-name (release-name release))}${(release-version-string release)}." x))
   *patch-list*))

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

(defun system-lisps (system input-directory &optional info)
  (unless info
    (setf info (make-hash-table :test #'equal))
    (loop for lisp in '("sbcl" "clisp" "ccl")
       do (setf (gethash lisp info)
		(read-lines (merge-pathnames* (format nil "blacklist.~a" lisp) input-directory)))))
  (let (lisps)
    (loop for lisp being the hash-keys of info using (hash-value blacklist)
       do (unless (member system
			  blacklist
			  :test #'string=)
	    (push lisp lisps)))
    (loop for dep in (system-lisp-deps system)
       do (setf lisps (intersection lisps (system-lisps dep input-directory info))))
    lisps))

  
(defun generate-nix-file (system-to-load input-directory output-directory)
  (with-open-file (outf (merge-pathnames* (format nil "~A.nix" (translate-system-name system-to-load)) output-directory)
			:direction :output
			:if-exists :supersede)
    ;(princ (pathname outf) *error-output*)
  (princ
   (generate-nix-expr system-to-load
		      (system-version-string system-to-load)
		      (system-lisp-deps system-to-load)
		      (remove-duplicates (system-extra-deps system-to-load :deps t) :test #'equal)
		      (remove-duplicates (system-extra-deps system-to-load :inputs t) :test #'equal)
		      (system-patches system-to-load input-directory)
		      (system-lisps system-to-load input-directory))
   outf)))

(defun ql-projects ()
  (ql::provided-releases t))

#+#:debug(defun release-systems (project whitelist)
  (let ((result (%release-systems project whitelist)))
    (format t "~&RELEASE-SYSTEMS: '~A' => ~{~A, ~^~}~%" project result)
    result))

(defun release-systems (project whitelist)
  (loop for system in whitelist
     when (string= (release-name (system-release system))
		   (release-name project))
       collect system))

(defun blacklisted-release-p (release systems)
  (null (release-systems release systems)))

(defun all-release-deps-in (release set systems)
  (not (set-difference (release-deps release systems) set :test #'string= :key #'release-name)))

(defun release-deps (project whitelist)
  (remove (release-name project)
	  (remove-duplicates
	   (loop
	      for system in (release-systems project whitelist)
	      nconc (loop for dep in (system-lisp-deps system)
		       collect (system-release dep))))
	  :key #'release-name :test #'string=))

(defun sort-releases (system-blacklist)
  (let ((systems (sort-ql-systems
		  (map 'list #'system-name
		       (ql:system-apropos-list ""))
		  system-blacklist)))
    (loop
       with result and last-completed-releases and blacklist and tests-removed
       for releases = (ql-projects)
       then (loop
	       for release in releases
	       if (blacklisted-release-p release systems)
	       do (pushnew release blacklist)
	       else if (all-release-deps-in release result systems)
	       do (push release result)
	       else collect release)
       do (format t "~&~a releases resolved, ~a to go~%" (length result) (length releases))
       when (equal last-completed-releases releases)
       do
	 (if tests-removed
	     (progn
	       (when releases
		 (format t "~%Unable to resolve dependencies for: ~{~%   ~A~}~%"
			 (map 'list
			      #'release-name
			      releases)))
	       (return (nreverse result)))
	     (setf systems (remove-test-systems releases systems)
		   tests-removed t))
       do
	 (setf last-completed-releases releases))))

(defun remove-test-systems (releases whitelist)
  (loop
     with new-whitelist = (copy-list whitelist)
     for release in releases
     do (loop for system in (release-systems release new-whitelist)
	   when (search "test" system)
	     do (setf new-whitelist (delete system new-whitelist :test #'string=)))
     finally (return new-whitelist)))

(defun append-to-input-file (fname line)
  (let ((path (merge-pathnames* fname *information-directory*)))
    (if (member line (read-lines path) :test #'string=)
	nil
	(with-open-file (f path 
			   :direction :output
			   :if-does-not-exist :create
			   :if-exists :append)
	  (format f "~A~%" line)
	  t))))

(defun scan-group-one (regex string)
  (ignore-errors
    (elt (nth-value 1 (cl-ppcre:scan-to-strings regex string))
	 0)))

(defun library-test (string)
  (cl-ppcre:scan
   #?/(?m)(Unable to load any of the alternatives:\n|Unable to load foreign library \([^\)]*\).\n|fatal error:|Couldn't load foreign libraries|Couldn't load foreign library)[^\n]*${string}/ 
		 *nix-build-output*))

(defun library-replace (system old-dep old-input new-dep new-input)
  (let* ((path (merge-pathnames* "extradeps.txt" *information-directory*))
	 (lines (read-lines path)))
    (write-lines path (remove #?"(system) $(old-dep) $(old-input)" lines))
    (library-add system new-dep new-input)))

(defun library-add (system dep input)
  (append-to-input-file
   "extradeps.txt"
   #?"$(system) $(dep) $(input)"))

(defvar *library-info*
  (list
   "libwebkit2gtk[.\"-]" "gnome3" "gnome3.webkitgtk"
   "Python[.]h:" :blacklist :blacklist
   "libportaudio[.\"-]" "portaudio" "portaudio"
   "libzmq[.\"-]" "zeromq" "zeromq"
   "libvorbisfile[.\"-]" "libvorbis" "libvorbis"
   "libssh2[.\"-]" "libssh2" "libssh2"
   "libtcod[.\"-]" :blacklist :blacklist
   "libSDL2_ttf[.\"-]" "SDL2_ttf" "SDL2_ttf" 
   "libSDL2_mixer[.\"-]" "SDL2_mixer" "SDL2_mixer" 
   "libSDL2_net[.\"-]" "SDL2_net" "SDL2_net" 
   "libSDL2_gfx[.\"-]" "SDL2_gfx" "SDL2_gfx" 
   "libSDL2_image[.\"-]" "SDL2_image" "SDL2_image" 
   "libSDL2[.\"-]" "SDL2" "SDL2" 
   "zmq[.]h:" "zeromq" "zeromq"
   "libpng12[.\"-]" "libpng12" "libpng12" 
   "png[.]h:" "libpng" "libpng"
   "libgfortran[.\"-]" :blacklist :blacklist
   "libmagic[.\"-]" "file" "file" 
   "liblmdb[.\"-]" "lmdb" "lmdb" 
   "libLLVM[.\"-]" :blacklist :blacklist
   "liblapack[.\"-]" :blacklist :blacklist
   "libblas[.\"-]" "blas" "blas"
   "libleveldb[.\"-]" "leveldb" "leveldb"
   "libgtk-3[.\"-]" "gnome3" "gnome3.gtk"
   "libgdk-3[.\"-]" "gnome3" "gnome3.gtk"
   "FLAC/stream_decoder[.]h:" "flac" "flac"
   "libz[.\"-]" "zlib" "zlib"
   "libsqlite3[.\"-]" "sqlite" "sqlite"
   "libsqlite[.\"-]" :blacklist :blacklist
   "libpq[.\"-]" "postgresql" "postgresql"
   "libiodbc[.\"-]" "libiodbc" "libiodbc"
   "librsvg[.\"-]" "librsvg" "librsvg"
   "amqp[.]h:" "rabbitmq-c" "rabbitmq-c"
   "libout123[.\"-]" :blacklist :blacklist
   "libOpenCL[.\"-]" "ocl-icd" "ocl-icd"
   "libmonitors[.\"-]" :blacklist :blacklist
   "libxml2[.\"-]" "libxml2" "libxml2"
   "uv[.]h:" "libuv" "libuv"
   "libfarmhash[.\"-]" :blacklist :blacklist
   "liballegro_dialog[.\"-]" :blacklist :blacklist
   "liballegro[.\"-]" "allegro5" "allegro5"
   "libgdk-x11-2[.\"-]" "gnome2" "gnome2.gtk"
   "libgssapi_krb5[.\"-]" "kerberos" "kerberos"
   "gssapi[.]h:" "kerberos" "kerberos"
   "libglut[.\"-]" "freeglut" "freeglut"
   "libglfw[.\"-]" "glfw" "glfw"
   "libgit2[.\"-]" "libgit2" "libgit2"
   "fuse[.]h:" "fuse" "fuse"
   "ftsystem[.]h:" "freetype" "freetype"
   "ft2build[.]h:" "freetype" "freetype"
   "fam[.]h:" "fam" "fam"
   "ncurses[.]h:" "ncurses" "ncurses"
   "libgdk_pixbuf[.\"-]" "gdk_pixbuf" "gdk_pixbuf"
   "libcairo[.\"-]" "cairo" "cairo"
   "libalut[.\"-]" "freealut" "freealut"
   "libffi[.\"-]" "libffi" "libffi"
   "vorbisfile[.]h" "libvorbis" "libvorbis"
   "libsnappy[.\"-]" "snappy" "snappy"
   "libssl[.\"-]" "openssl" "openssl"
   "libsqlite3[.\"-]" "sqlite" "sqlite"
   "libsane[.\"-]" "sane-backends" "sane-backends"
   "libR[.\"-]" "R" "R"
   "libpcap[.\"-]" "libpcap" "libpcap"
   "libpapi[.\"-]" :blacklist :blacklist
   "libSDL_ttf[.\"-]" "SDL_ttf" "SDL_ttf"
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

(defun check-all-libs (system)
  (loop for (libexpr dep input) on *library-info* by #'cdddr
     if (library-test libexpr)
     if (eql dep :blacklist)
     do (format *error-output* "~%Blacklisting system due to it depending on ~A.~%" libexpr)
       (blacklist-system system "Depends on libexpr")
       (return t)
     else
     do (library-add system dep input)
       (return t)))

(defun blacklist-system (system reason)
  (if (cl-ppcre:scan "Nix Build failed with all lisps" *nix-build-output*)
      (append-to-input-file "blacklist.txt" (format nil "~A #~A" system reason))
      (let
	  ((impl (elt (nth-value 1 (cl-ppcre:scan-to-strings "Failed build for lisp ([^ \\n]*)" *nix-build-output*)) 0)))
	(cond
	  ((ends-with-subseq "/clisp" impl)
	   (assert (append-to-input-file "blacklist.clisp" system)))
	  ((or
	    (ends-with-subseq "/lx86cl64" impl)
	    (ends-with-subseq "/lx86cl" impl))
	   (assert (append-to-input-file "blacklist.ccl" system)))
	  ((ends-with-subseq "/sbcl" impl)
	   (assert (append-to-input-file "blacklist.sbcl" system)))
	  (t (error "Unknown implementation ~a" impl))))))



(defun maybe-correct (system-name)
 (cond
   ((check-all-libs system-name)
    t)
    ((let ((pkg (scan-group-one "required by #<SYSTEM \"([^\"]+)\">" *nix-build-output*)))
       (and pkg
            (not (equalp pkg system-name))
	    (not (member pkg (system-lisp-deps system-name) :test #'equalp))))
     (append-to-input-file
      "extralispdeps.txt"
      (format nil "~A ~A"
	      system-name
	      (scan-group-one "required by #<SYSTEM \"([^\"]+)\">" *nix-build-output*))))
    #|
    ((or
       (cl-ppcre:scan "#<PACKAGE-INFERRED-SYSTEM" *nix-build-output*)
       (cl-ppcre:scan "#<ASDF/PACKAGE-INFERRED-SYSTEM" *nix-build-output*))
     (append-to-input-file
      "extralispdeps.txt"
      (format nil "~A ~A"
	      system-name
	      (elt (nth-value 1 (cl-ppcre:scan-to-strings
				 "Component \"([^\"]+)\" not found"
				 *nix-build-output*))
		   0))))
    |#
    ((and
       (cl-ppcre:scan "Component \"([^\"]+)\" not found" *nix-build-output*)
       (let ((name (elt (nth-value 1 (cl-ppcre:scan-to-strings
                                       "Component \"([^\"]+)\" not found"
                                       *nix-build-output*))
                        0)))
         (unless (equalp system-name name)
           (append-to-input-file
             "extralispdeps.txt"
             (format nil "~A ~A"
                     system-name
                     (string-downcase name))))))
     t)
    ((cl-ppcre:scan "does not currently work with GSL version 2.x" *nix-build-output*)
     (library-replace system-name "gsl" "gsl" "gsl_1" "gsl_1"))
    ((and
       (cl-ppcre:scan "Component ([^ ]+) not found" *nix-build-output*)
       (let ((groups (nth-value 1 (cl-ppcre:scan-to-strings "Component ([^: ]*:([^ ]*)|\"([^\"]+)\") not found" *nix-build-output*))))

         (unless (equalp
                   (or (elt groups 1) (elt groups 2))
                   system-name)
          (append-to-input-file
            "extralispdeps.txt"
            (let ((groups (nth-value 1 (cl-ppcre:scan-to-strings "Component ([^: ]*:([^ ]*)|\"([^\"]+)\") not found" *nix-build-output*))))
              (format nil "~A ~A"
                      system-name
                      (string-downcase
                        (or (elt groups 1) (elt groups 2)))))) )))
     t)
    (t nil)))

(defun fixup-rules (system-name)
  (let* ((end-line (search "Failed build for lisp "
			   *nix-build-output*))
	 (end (and end-line (position #\Newline *nix-build-output* :start end-line)))
	 (start (search "Starting build for lisp "
			*nix-build-output*
			:end2 end
			:from-end t)))
    (format *error-output* "~&~%F-R: ~A ~A ~A~%~%" end-line end start)
    (unless (search "Nix Build failed with all lisps"
		    *nix-build-output*)
      (setf *nix-build-output*
	    (subseq *nix-build-output* start (1+ end))))
  (format *error-output* "OUTPUT:~%~A" *nix-build-output*)
  
  (cond
    ((maybe-correct system-name))
    ((cl-ppcre:scan "Couldn't execute \"swig\": No such file or directory" *nix-build-output*)
     (library-add system-name "swig" "swig"))
    ((cl-ppcre:scan "/usr/lib/R/" *nix-build-output*)
     (format *error-output* "~%Blacklisting package until I have a way to add custom hooks: ~A~%" system-name)
     (blacklist-system system-name "Need custom hooks"))
    ((cl-ppcre:scan "No qmake found" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to be being too lazy to figure out why qmake doesn't work: ~A~%" system-name)
     (blacklist-system system-name "qmake not supported yet"))
					;(library-add system-name "kde4" "kde4.qt4"))
    ((cl-ppcre:scan "fatal error: lfp.h: No such file or directory" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to Nix's libfixposix being too old: ~A~%" system-name)
     (blacklist-system system-name "Need newer libfixposix"))
    ((cl-ppcre:scan "curl: command not found" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to it invoking curl during build; this can be fixed by patching the build process to not fetch from the internet: ~A~%" system-name)
     (blacklist-system system-name "Invokes curl during build"))
    ((cl-ppcre:scan "git: command not found" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to it invoking git during build; this can be fixed by patching the build process to not fetch from the internet: ~A~%" system-name)
     (blacklist-system system-name "Invokes git during build"))
    ((cl-ppcre:scan "#<DEFCONSTANT-UNEQL" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to improper defconstant: ~A~%" system-name)
     (blacklist-system system-name "Improper defconstant"))
    ((cl-ppcre:scan "Heap exhausted, game over" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due heap exhaustion: ~A~%" system-name)
     (blacklist-system system-name "Heap exhaustion"))
    ((cl-ppcre:scan "invalid ELF header." *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to it appearing to be 32-bit only: ~A~%" system-name)
     (blacklist-system system-name "Invalid ELF header"))
    ((cl-ppcre:scan "#<TYPE-ERROR expected-type:" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to type error: ~A~%" system-name)
     (blacklist-system system-name "Type error"))
    ((cl-ppcre:scan "conflicts with its asserted type" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to type error: ~A~%" system-name)
     (blacklist-system system-name "Type error 2"))
    ((cl-ppcre:scan "/homeless-shelter/" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to it accessing home directory ~A~%" system-name)
     (blacklist-system system-name "Accesses home directory during build"))
    ((cl-ppcre:scan "conflicting with its asserted type" *nix-build-output*)
     (format *error-output* "~%Blacklisting package due to type warning: ~A~%" system-name)
     (blacklist-system system-name "Type warning"))
    ((or
      (cl-ppcre:scan "Permission denied : #P\"/nix/store/" *nix-build-output*)
      (cl-ppcre:scan "error opening ..\"/nix/store/" *nix-build-output*))
     (blacklist-system system-name "Tries to write to asdf directory"))
    ((cl-ppcre:scan "OPERATION-ERROR" *nix-build-output*)
     (blacklist-system system-name "Operation error"))
    ((cl-ppcre:scan "COMMAND  = .*swig" *nix-build-output*)
     (library-add system-name "swig" "swig"))
    ((cl-ppcre:scan "ld: cannot open output file /nix/store/.* Permission denied" *nix-build-output*)
     (blacklist-system system-name "Tries to write to asdf directory 2"))
    ((cl-ppcre:scan "please check mpicc." *nix-build-output*)
     (blacklist-system system-name "Requires mpicc"))
    ((cl-ppcre:scan "Bad bounding indices .* for SEQUENCE" *nix-build-output*)
     (blacklist-system system-name "Bad bounding icidices"))
    ((cl-ppcre:scan "does not currently work with GSL version 2.x" *nix-build-output*)
     (library-replace system-name "gsl" "gsl" "gsl_1" "gsl_1"))
    ((cl-ppcre:scan "also exports the following symbols:" *nix-build-output*)
     (blacklist-system system-name "package redefinition missing exports"))
    ((cl-ppcre:scan "error: .* has no member named" *nix-build-output*)
     (blacklist-system system-name "C compiler error 1"))
    ((cl-ppcre:scan "Unhandled memory fault at " *nix-build-output*)
     (blacklist-system system-name "Memory fault"))
    ((cl-ppcre:scan "Sorry, your dialect of Lisp is not yet supported." *nix-build-output*)
     (blacklist-system system-name "Sorry, your dialect of Lisp is not yet supported."))
    ((cl-ppcre:scan ": variable .* has no value" *nix-build-output*)
     (blacklist-system system-name "Variable has no value"))
    ((cl-ppcre:scan "NO-APPLICABLE-METHOD: When calling|There is no applicable method for the generic function:" *nix-build-output*)
     (blacklist-system system-name "No applicable method"))
    ((cl-ppcre:scan "The macro ~S may not be called with ~S arguments: ~S" *nix-build-output*)
     (blacklist-system system-name "macro parameter list mismatch"))
    ((cl-ppcre:scan "PACKAGE.*is locked" *nix-build-output*)
     (blacklist-system system-name "Package is locked"))
    ((cl-ppcre:scan "FUNCALL: undefined function" *nix-build-output*)
     (blacklist-system system-name "FUNCALL: undefined function"))
    ((cl-ppcre:scan "~S has ~D, but ~S has ~D optional parameter~:P" *nix-build-output*)
     (blacklist-system system-name "parameter list mismatch"))
    ((cl-ppcre:scan
      (format nil "Component \"~a\" not found" system-name) *nix-build-output*)
     (blacklist-system system-name #?"Component not found $(system-name)"))
    ((cl-ppcre:scan "Bound is not \\*, a FLOAT or a list of a FLOAT" *nix-build-output*)
     (blacklist-system system-name "Type mismatch"))
    ((cl-ppcre:scan "Component \"([^\"]+)\" not found" *nix-build-output*)
     (cl-ppcre:register-groups-bind (component)
	 ("Component \"([^\"]+)\" not found" *nix-build-output*)
       (blacklist-system system-name #?'Component "$(component)" not found')))
    ((not (cl-ppcre:scan "Nix Build failed with all lisps" *nix-build-output*))
     (blacklist-system system-name "Failed on some, but not all lisps"))
    (t
      (format *error-output* "~%Unable to fixup system ~A:~%~A~%" system-name *nix-build-output*)
       (uiop:quit 1)))))
       

