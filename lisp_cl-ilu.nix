
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-devil, 
  libdevil,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi libdevil ];
      inherit stdenv;
      systemName = "cl-ilu";
      
      sourceProject = "${lisp-project_cl-devil}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-ilu-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
