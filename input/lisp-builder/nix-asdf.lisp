(defpackage "NIX-ASDF"
  (:use :cl :uiop)
  ;(:export "CALCULATE-TRANSLATION")
  (:export "MAKE-BUNDLE" "TEST-BUNDLE"))

(in-package :nix-asdf)

#|
(defvar *store-writable* nil)

(defun apply-standard-translation (path &optional (base :home))
  (let*
      ((root (pathname-root path))
       (absolute-source (wilden root)))
    (translate-pathname*
     path
     absolute-source
     (resolve-location `(,base ".cache" "common-lisp" :implementation :**/ :*.*.*))
     root
     t)))

(defun apply-store-translation (path absolute-source)
  (destructuring-bind
	(abs nix store store-path &rest r)
      (pathname-directory path)
      (declare (ignore r))
      (assert (eql abs :absolute))
      (assert (string= nix "nix"))
      (assert (string= store "store"))
    (translate-pathname*
     path
     absolute-source
     (resolve-location `("/nix/store/" ,store-path "common-lisp/bin-cache/" :**/ :*.*.*))
     nil
     absolute-source)))


(defun calculate-translation (path absolute-source)
  (declare (ignorable absolute-source))
#-#:temporarily-disable-build-caching(apply-standard-translation path "/tmp")
#+#:temporarily-disable-build-caching(let ((translation (apply-store-translation path absolute-source)))
    (cond
      ((probe-file* translation) translation)
      ((not *store-writable*)
       (apply-standard-translation path))
      ((relative-pathname-p
	(enough-pathname path *store-writable*))
       (apply-store-translation path absolute-source))
      (t
       (apply-standard-translation path "/tmp")))))

(asdf:clear-output-translations)
;;; Workaround for https://bugs.launchpad.net/asdf/+bug/1631771
(progn
  (asdf:upgrade-asdf)
  (asdf::clear-defined-systems))
(asdf:initialize-output-translations
 (getenv "NIX_ASDF_OUTPUT_TRANSLATIONS"))
|#

(defun make-bundle% (system-name bundle-dir)
  #+sbcl(setf SB-IMPL::*DEFAULT-EXTERNAL-FORMAT* :utf-8)
  (asdf:operate 'asdf:deliver-asd-op system-name)
  (let ((files (append
		(asdf:output-files 'asdf:deliver-asd-op system-name)
		(asdf:output-files 'asdf:compile-bundle-op system-name))))
    (loop for file in files
       for dest = (uiop:merge-pathnames* (make-pathname :name (pathname-name file)
							:type (pathname-type file))
					 (ensure-directory-pathname (parse-unix-namestring bundle-dir)))
       do
	 (format *error-output* "Copying to ~A~%" dest)
	 (ensure-directories-exist dest)
	 (copy-file file dest))
    (uiop:copy-file (asdf:system-source-file system-name)
		    (uiop:merge-pathnames* 
		     "originalasd.txt"
		     (ensure-directory-pathname (parse-unix-namestring bundle-dir))))))
		     

(defun make-bundle (system-name bundle-dir)
  (handler-case
      (make-bundle% system-name bundle-dir)
    (error (condition)
      (let ((*print-readably* nil))
	(terpri *error-output*)
	(print condition *error-output*)
	(princ condition *error-output*)
	(describe condition *error-output*)
	(terpri *error-output*))
      (quit 1 t)))
  (uiop:quit 0))

(defun test-bundle (system-name)
  #+sbcl(setf SB-IMPL::*DEFAULT-EXTERNAL-FORMAT* :utf-8)
  (handler-case 
      (progn
	(asdf:load-system system-name)
	(uiop:quit 0 t))
    (error (condition)
      (let ((*print-readably* nil))
	(terpri *error-output*)

	(print condition *error-output*)
	(princ condition *error-output*)
	(describe condition *error-output*)
	(terpri *error-output*))
      (uiop:quit 1 t))))
