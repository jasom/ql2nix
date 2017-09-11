
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-oclapi, 
  ocl-icd,   lisp_alexandria, lisp_cffi, lisp_cl-annot, lisp_cl-syntax-annot, lisp_cl-reexport,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cl-annot lisp_cl-syntax-annot lisp_cl-reexport ocl-icd ];
      inherit stdenv;
      systemName = "cl-oclapi";
      
      sourceProject = "${lisp-project_cl-oclapi}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cl-annot} ${lisp_cl-syntax-annot} ${lisp_cl-reexport}";
      name = "lisp_cl-oclapi-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
