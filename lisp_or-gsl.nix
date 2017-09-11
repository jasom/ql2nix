
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-opsresearch, 
  gsl,   lisp_cffi, lisp_cl-opsresearch,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-opsresearch gsl ];
      inherit stdenv;
      systemName = "or-gsl";
      
      sourceProject = "${lisp-project_cl-opsresearch}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-opsresearch}";
      name = "lisp_or-gsl-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
