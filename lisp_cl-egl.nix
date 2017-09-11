
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-egl, 
  mesa,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi mesa ];
      inherit stdenv;
      systemName = "cl-egl";
      
      sourceProject = "${lisp-project_cl-egl}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-egl-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
