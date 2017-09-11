
{ buildLispPackage, stdenv, fetchurl, lisp-project_quickutil, 
   lisp_cl-fad, lisp_cl-markdown, lisp_cl-ppcre, lisp_cl-syntax, lisp_cl-syntax-annot, lisp_clack-middleware-csrf, lisp_closure-template, lisp_dbi, lisp_multival-plist, lisp_ningle, lisp_quickutil-utilities, lisp_trivial-shell, lisp_yason,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-markdown lisp_cl-ppcre lisp_cl-syntax lisp_cl-syntax-annot lisp_clack-middleware-csrf lisp_closure-template lisp_dbi lisp_multival-plist lisp_ningle lisp_quickutil-utilities lisp_trivial-shell lisp_yason  ];
      inherit stdenv;
      systemName = "quickutil-server";
      
      sourceProject = "${lisp-project_quickutil}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-markdown} ${lisp_cl-ppcre} ${lisp_cl-syntax} ${lisp_cl-syntax-annot} ${lisp_clack-middleware-csrf} ${lisp_closure-template} ${lisp_dbi} ${lisp_multival-plist} ${lisp_ningle} ${lisp_quickutil-utilities} ${lisp_trivial-shell} ${lisp_yason}";
      name = "lisp_quickutil-server-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
