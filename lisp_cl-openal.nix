
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-openal, 
  openal,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi openal ];
      inherit stdenv;
      systemName = "cl-openal";
      
      sourceProject = "${lisp-project_cl-openal}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-openal-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
