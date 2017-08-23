(uiop:define-package ql2nix
  (:mix :cl :split-sequence :uiop :alexandria :lparallel))

(declaim (optimize (debug 3) (speed 0)))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (named-readtables:find-readtable :cl-interpol)
    (named-readtables:defreadtable :cl-interpol
      (:merge :current)
      (:dispatch-macro-char #\# #\? #'interpol::interpol-reader))))

(in-package #:ql2nix)

(named-readtables:in-readtable :cl-interpol)

(defvar *nix-build-output*)
(defvar *information-directory* nil)
(defvar *deps-hash* (make-hash-table :test #'equal))
(defvar *nobundles* nil)
(defvar *patch-list* nil)
(defvar *library-info*
  (list
   "libsoloud[.\"-]" :blacklist :blacklist
   "libXcomposite[.\"-]" "xorg" "xorg.libXcomposite"
   "k8055[.\"-]" :blacklist :blacklist
   "libpixman[.\"-]" "xorg" "xorg.pixman"
   "libwayland-server[.\"-]" "wayland" "wayland"
   "libclBLAS[.\"-]" "clblas-cuda" "clblas-cuda"
   "libgbm[.\"-]" "mesa" "mesa"
   "libdrm[.\"-]" "libdrm" "libdrm"
   "libEGL[.\"-]" "mesa" "mesa"
   "libwebkit2gtk[.\"-]" "gnome3" "gnome3.webkitgtk"
   "libosicat[.\"-]" :blacklist :blacklist
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

(defmacro defmemoize (fn access-form args &body b)
  (alexandria:with-gensyms (result present)
    `(defun ,fn ,args
       (multiple-value-bind (,result ,present) ,access-form
	 (if ,present ,result
	     (setf ,access-form (progn ,@b)))))))

(defmemoize ql-immediate-deps
    (gethash package *deps-hash*)
    (package)
  (cdr (mapcar (lambda (x) (slot-value (if (listp x) (car x) x) 'ql::name))
	       (ql::dependency-tree package))))

(defun translate-system-name (system-name)
  (format nil "lisp-~A"
	  (substitute-if-not #\- #'alphanumericp (string-downcase system-name))))

(defun translate-project-name (project-name)
  (format nil "lisp-project-~A"
	  (substitute-if-not #\- #'alphanumericp (string-downcase project-name))))

(defun comma-list (list)
  (when list
    (append list '(" "))))

(defstruct system-info
  (name "")
  (version "")
  (lisp-deps "")
  (foreign-deps "")
  (foreign-inputs "")
  (patches "")
  (release "")
  (lisp-implementations nil))

(defun generate-system-info (name completed-systems input-directory)
  (assert (stringp name))
  (let* ((lisp-deps (system-lisp-deps name))
         (lisp-deps
           (loop for dep in lisp-deps
                 collect (gethash dep completed-systems))))
    (unless (member nil lisp-deps)
      (make-system-info
        :name name
        :version (system-version-string name)
        :lisp-deps lisp-deps
        :foreign-deps (remove-duplicates (system-foreign-deps name :deps t) :test #'equal)
        :foreign-inputs (remove-duplicates (system-foreign-deps name :inputs t) :test #'equal)
        :patches (system-patches name input-directory)
        :release (system-release name)
        :lisp-implementations (system-lisps name input-directory completed-systems)))))



(defun generate-nix-expr (name version system-deps foreign-deps foreign-inputs patches
			  lisp-implementations)
  #+(or)(assert (or (not (member "cffi" system-deps :test #'equal))
	      (not (null foreign-deps))))
  (let ((cl-interpol:*list-delimiter* ", ")
	(nix-system-deps (map 'list
                              (compose #'translate-system-name #'system-info-name)
                              system-deps))
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
        sha256 = "$[md5]";
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


(defun system-nobundle-p (system-name)
  (unless *nobundles*
    (setf *nobundles*
	  (read-lines (merge-pathnames* "nobundle.txt" *information-directory*))))
  (member system-name *nobundles* :test #'string=))

(defun system-foreign-deps (system-name &key deps inputs)
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
  
(defun all-releases (systems)
  (loop with result
       for system being the hash-values of systems
       when (system-info-release system)
       do (pushnew (system-info-release system) result :key #'release-name :test #'string=)
       else do (format *error-output* "~&Can't find release for system: ~A~%" system)
       finally (return result)))

(defun generate-build (input-directory output-directory systems completed-systems)
  (let ((releases
          (union
            (all-releases systems)
            (all-releases completed-systems)
            :test #'equal
            :key #'release-name)))
    ;;(print releases *error-output*)
    (generate-default-nix-file systems completed-systems releases output-directory)
    (loop for system being each hash-value of systems
       do ;(format t "~&~A~%" system)
	 (generate-nix-file system output-directory))
    (loop for system being each hash-value of completed-systems
          do ;(format t "~&~A~%" system)
          (generate-nix-file system output-directory))
    (loop
       for release in releases
       do (generate-release-nix-file release input-directory output-directory))))

(defun setup-output (indir outdir)
  (uiop:run-program `("rm" "-rf" ,(unix-namestring outdir)))
  (uiop:ensure-all-directories-exist (list outdir))
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
  (declare (ignore skip))
  (setf *kernel* (make-kernel 16))
  (let* ((completed-systems (make-hash-table :test #'equal))
	 (channel (make-channel))
	 (*information-directory* input-directory))
    (loop
       for blacklisted-systems = (map 'list
				      (lambda (x) (car (split-sequence #\Space x)))
				      (read-lines (merge-pathnames* "blacklist.txt" input-directory)))
       for all-systems = (set-difference
                          (map 'list #'system-name (ql:system-apropos-list ""))
                          blacklisted-systems
                          :test #'string=)
       for systems-to-build = (make-hash-table :test #'equal)
       do
         (loop for name in all-systems
	    for system = (and (not (gethash name completed-systems))
			      (generate-system-info name completed-systems input-directory))
	    when system do (setf (gethash name systems-to-build) system))
         (format *error-output* "Systems to build: ~% ~A"
		 (alexandria:hash-table-keys  systems-to-build))
         (setup-output input-directory output-directory)
         (generate-build input-directory output-directory systems-to-build completed-systems)
       until (zerop (hash-table-count systems-to-build))
       do (let ((submitted-tasks
		 (loop for system being each hash-key of systems-to-build
		    sum 1
		    do
		      (submit-task channel
				   'build-one-system system output-directory))))
	    (loop repeat submitted-tasks
	       for (system result *nix-build-output*) = (receive-result channel)
	       for progress = (/ (hash-table-count completed-systems) (length all-systems))
	       do
		 (format *error-output* "~A~%Progress: ~A (~A%)~%"
			 *nix-build-output*
			 (hash-table-count completed-systems)
			 (float (* 100 progress)))
	       unless result
	       do (fixup-rules system)
	       else do
		 (format *error-output* "~&Successfully completed ~A~%" system)
		 (setf (gethash system completed-systems)
		       (gethash system systems-to-build)))))
    (format *error-output* "~&Finished; unbuilt systems:~% ~A"
            (set-difference (map 'list #'system-name (ql:system-apropos-list ""))
                            (alexandria:hash-table-keys completed-systems)
                            :test #'equal))))

(defun build-one-system (system-name output-directory)
  (multiple-value-bind (_ nix-build-output error-code)
      (uiop:run-program `("nix-build"
			  ;;"--option" "use-binary-caches" "false"
			  "-A" ,(translate-system-name system-name)
			  ,(uiop:unix-namestring output-directory))
			:output t
			:error-output :string
			:ignore-error-status t)
    (declare (ignore _))
    (list
     system-name
     (= error-code 0)
     nix-build-output)))

(defun generate-default-nix-file (systems completed-systems projects output-directory)
  (with-open-file (outf (merge-pathnames* "default.nix"  output-directory)
			:direction :output
			:if-exists :supersede)
    (write-sequence
    (let ((cl-interpol:*list-delimiter* #?"\n")
	  (translated-names (map 'list #'translate-system-name
                                 (append (alexandria:hash-table-keys systems)
                                         (alexandria:hash-table-keys completed-systems))))
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

(defun system-lisps (system input-directory completed-systems)
  (let ((lisps
          (loop for lisp in '("sbcl" "clisp" "ccl")
                unless (member system 
                               (read-lines (merge-pathnames* (format nil "blacklist.~a" lisp) input-directory))
                               :test #'equal)
                collect lisp)))
    (when lisps
      (loop for dep in (system-lisp-deps system)
            unless (equal dep system)
            do (setf lisps (intersection lisps
                                         (system-info-lisp-implementations
                                           (gethash dep completed-systems))
                                         :test #'equal))))
    lisps))

(defun generate-nix-file (system-to-load output-directory)
  (with-open-file (outf (merge-pathnames* (format nil "~A.nix" (translate-system-name (system-info-name system-to-load))) output-directory)
			:direction :output
			:if-exists :supersede)
    ;(princ (pathname outf) *error-output*)
  (princ
   (generate-nix-expr (system-info-name system-to-load)
                      (system-info-version system-to-load)
                      (system-info-lisp-deps system-to-load)
                      (system-info-foreign-deps system-to-load)
                      (system-info-foreign-inputs system-to-load)
                      (system-info-patches system-to-load)
                      (system-info-lisp-implementations system-to-load))
   outf)))

(defun ql-projects ()
  (ql::provided-releases t))

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

(defun blacklist-system (system reason &optional force-all)
  (if (or
        (cl-ppcre:scan "Nix Build failed with all lisps" *nix-build-output*)
        force-all)
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
    ((let ((pkg (scan-group-one "Component #?:([^ ]+) not found" *nix-build-output*)))
       (when 
         (and pkg
              (not (equalp pkg system-name))
              (not (member pkg (system-lisp-deps system-name) :test #'equalp)))
         (append-to-input-file "extralispdeps.txt"
                              (format nil "~A ~A"  system-name (string-downcase pkg)))))
     t)
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
    (unless (or
              (search "Nix Build failed with all lisps"
                      *nix-build-output*)
              (null end)
              (null start))
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
    ((cl-ppcre:scan "CHECKL:DEFINE-TEST-OP" *nix-build-output*)
     (blacklist-system system-name "checkl in .asd not supported"))
    ((cl-ppcre:scan "has an unfree license" *nix-build-output*)
     (blacklist-system system-name "Depends on non-free library" t))
    ((cl-ppcre:scan "No implementations for package" *nix-build-output*)
     (blacklist-system system-name "No lisp that supports all deps"))
    ((not (cl-ppcre:scan "Nix Build failed with all lisps" *nix-build-output*))
     (blacklist-system system-name "Failed on some, but not all lisps"))
    (t
      (format *error-output* "~%Unable to fixup system ~A:~%~A~%" system-name *nix-build-output*)
       (uiop:quit 1)))))
