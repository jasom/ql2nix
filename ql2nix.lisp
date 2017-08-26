#!/bin/sh
#|
SCRIPT_DIR="$(dirname "$0")"
sh ./prepareql.sh
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

(load (merge-pathnames* "localql/setup.lisp" (script-pathname)))
(asdf:initialize-source-registry '(:source-registry :ignore-inherited-configuration))



(eval-when (:compile-toplevel :load-toplevel :execute)
 (sb-ext:restrict-compiler-policy 'debug 3))
(asdf:load-asd (merge-pathnames "ql2nix.asd" (script-pathname)))
(ql:quickload "ql2nix" :silent t)
;(eval `(trace ,(intern "MAIN" :ql2nix)))
(funcall (intern "MAIN" :ql2nix)
	 (uiop:ensure-directory-pathname *input-directory*)
	 (uiop:ensure-directory-pathname *output-directory*)
         (parse-integer *skip*))
(uiop:quit)
