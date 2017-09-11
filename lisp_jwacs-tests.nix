
{ buildLispPackage, stdenv, fetchurl, lisp-project_jwacs, 
   lisp_cl-ppcre,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "jwacs-tests";
      
      sourceProject = "${lisp-project_jwacs}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_jwacs-tests-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
