#!/bin/sh
#|
SCRIPT_DIR="$(dirname "$0")"
exec sbcl --noinform --disable-ldb --lose-on-corruption --disable-debugger \
--no-sysinit --no-userinit --noprint \
--eval '(set-dispatch-macro-character #\# #\! (lambda (s c n)(declare (ignore c n)) (read-line s) (values)))' \
--eval "(defvar *system-to-load* \"$1\")" \
--eval "(defvar *ql-install* \"$SCRIPT_DIR/quicklisp.lisp\")" \
--eval "(defvar *qlclean* \"$SCRIPT_DIR/qlclean/\")" \
--load "$0"
|#
(defvar *extra-deps* (make-hash-table :test #'equal))

(if (probe-file (merge-pathnames "setup.lisp" *qlclean*))
  (load (merge-pathnames "setup.lisp" *qlclean*))
  (let ((*standard-output* *error-output*)
        (*trace-output* *error-output*))
    (load *ql-install*)
    (funcall (intern "INSTALL" "QUICKLISP-QUICKSTART") :path *qlclean*)))

(asdf:clear-source-registry)
(asdf:initialize-source-registry '(:source-registry :ignore-inherited-configuration))
(asdf:load-asd (merge-pathnames "ql2nix.asd" *load-pathname*))
(ql2nix::main *system-to-load8)
