(asdf:defsystem #:ql2nix
    :depends-on (#:cl-interpol #:uiop #:named-readtables #:split-sequence)
    :components ((:file "ql2nixlib")))
