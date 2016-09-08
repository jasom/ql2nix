(asdf:defsystem #:ql2nix
    :depends-on (#:cl-interpol #:uiop #:named-readtables)
    :components ((:file "ql2nixlib")))
