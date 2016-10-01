(defpackage :nix-asdf
  (:use :cl :uiop)
  (:export "CALCULATE-TRANSLATION"))
(in-package :nix-asdf)

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
  (let ((translation (apply-store-translation path absolute-source)))
    (cond
      ((probe-file* translation) translation)
      ((not *store-writable*)
       (apply-standard-translation path))
      ((relative-pathname-p
	(enough-pathname path *store-writable*))
       (apply-store-translation path absolute-source))
      (t
       (apply-standard-translation path "/tmp")))))

(trace calculate-translation)

(asdf:clear-output-translations)
(asdf:initialize-output-translations
 (getenv "NIX_ASDF_OUTPUT_TRANSLATIONS"))
