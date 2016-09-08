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

(defun prepare ()
  (asdf:clear-source-registry)
  (asdf:initialize-source-registry '(:source-registry :ignore-inherited-configuration))) 

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

(prepare)
;(format t "~{~A~%~}" (compute-all-deps *system-to-load*))
(format t "~{~A~%~}" (ql-immediate-deps *system-to-load*))
(uiop:quit 0)
