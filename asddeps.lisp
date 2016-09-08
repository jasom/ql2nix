#!/bin/sh
#|
SCRIPT_DIR="$(dirname "$0")"
exec sbcl --noinform --disable-ldb --lose-on-corruption --disable-debugger \
--no-sysinit --no-userinit --noprint \
--eval '(set-dispatch-macro-character #\# #\! (lambda (s c n)(declare (ignore c n)) (read-line s) (values)))' \
--eval "(defvar *system-to-load* \"$1\")" \
--eval "(defvar *asdf-file-to-load* \"$PWD/$2\")" \
--load "$0"
|#
(require 'asdf)

(defun prepare ()
  (asdf:clear-source-registry)
  (asdf:initialize-source-registry '(:source-registry :ignore-inherited-configuration)))


(defun asdf-immediate-deps (package asdf-file)
  (asdf:load-asd asdf-file)
  (slot-value (asdf:find-system package) 'asdf/system::depends-on))

(prepare)
;(format t "~{~A~%~}" (compute-all-deps *system-to-load*))
(format t "~{~A~%~}" (asdf-immediate-deps *system-to-load* *asdf-file-to-load*))
(uiop:quit 0)
