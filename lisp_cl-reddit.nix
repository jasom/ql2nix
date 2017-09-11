
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-reddit, 
   lisp_drakma, lisp_yason,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_yason  ];
      inherit stdenv;
      systemName = "cl-reddit";
      
      sourceProject = "${lisp-project_cl-reddit}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_yason}";
      name = "lisp_cl-reddit-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
