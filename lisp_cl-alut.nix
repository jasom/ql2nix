
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-openal, 
  freealut,   lisp_cffi, lisp_cl-openal,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-openal freealut ];
      inherit stdenv;
      systemName = "cl-alut";
      
      sourceProject = "${lisp-project_cl-openal}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-openal}";
      name = "lisp_cl-alut-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
