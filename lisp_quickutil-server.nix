
{ buildLispPackage, stdenv, fetchurl, lisp-project_quickutil, 
   lisp_trivial-shell, lisp_multival-plist, lisp_dbi, lisp_cl-markdown, lisp_closure-template, lisp_cl-heredoc, lisp_yason, lisp_clack-middleware-csrf, lisp_ningle,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-shell lisp_multival-plist lisp_dbi lisp_cl-markdown lisp_closure-template lisp_cl-heredoc lisp_yason lisp_clack-middleware-csrf lisp_ningle  ];
      inherit stdenv;
      systemName = "quickutil-server";
      
      sourceProject = "${lisp-project_quickutil}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-shell} ${lisp_multival-plist} ${lisp_dbi} ${lisp_cl-markdown} ${lisp_closure-template} ${lisp_cl-heredoc} ${lisp_yason} ${lisp_clack-middleware-csrf} ${lisp_ningle}";
      name = "lisp_quickutil-server-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
