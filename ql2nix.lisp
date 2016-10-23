#!/bin/sh
#|
SCRIPT_DIR="$(dirname "$0")"
exec sbcl --noinform --disable-ldb --lose-on-corruption --disable-debugger \
--no-sysinit --no-userinit --noprint \
--eval '(set-dispatch-macro-character #\# #\! (lambda (s c n)(declare (ignore c n)) (read-line s) (values)))' \
--eval "(defvar *script-args* '(\"$1\" \"$2\" \"${3:-0}\"))" \
--eval "(require :asdf)" \
--load "$0"
|#
(defpackage ql2nix-user
  (:use :cl :uiop))
(in-package :ql2nix-user)
(defmacro script-pathname ()
  '*load-pathname*)

(defvar *input-directory* (first cl-user::*script-args*))
(defvar *output-directory* (second cl-user::*script-args*))
(defvar *skip* (or (third cl-user::*script-args*) "0"))

(defvar *extra-deps* (make-hash-table :test #'equal))

(asdf:initialize-source-registry '(:source-registry :ignore-inherited-configuration))
(if (probe-file (merge-pathnames* "localql/setup.lisp" (script-pathname)))
  (load (merge-pathnames* "localql/setup.lisp" (script-pathname)))
  (let ((*standard-output* *error-output*)
        (*trace-output* *error-output*))
    (load (merge-pathnames* "quicklisp.lisp" (script-pathname)))
    (funcall (intern "INSTALL" "QUICKLISP-QUICKSTART") :path (merge-pathnames* "localql/" (pathname-directory-pathname (script-pathname))))))

;(asdf:clear-source-registry)
(asdf:load-asd (merge-pathnames "ql2nix.asd" (script-pathname)))
(ql:quickload "ql2nix" :silent t)
;(eval `(trace ,(intern "MAIN" :ql2nix)))
(funcall (intern "MAIN" :ql2nix)
	 (uiop:ensure-directory-pathname *input-directory*)
	 (uiop:ensure-directory-pathname *output-directory*)
         (parse-integer *skip*))
;(print (list-all-packages))
(uiop:quit)
