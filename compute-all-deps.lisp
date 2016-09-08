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
