
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-readline, 
  readline,   lisp_cffi, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_alexandria readline ];
      inherit stdenv;
      systemName = "cl-readline";
      
      sourceProject = "${lisp-project_cl-readline}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_alexandria}";
      name = "lisp_cl-readline-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
