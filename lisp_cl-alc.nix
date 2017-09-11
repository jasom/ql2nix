
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-openal, 
   lisp_cffi, lisp_cl-openal,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-openal  ];
      inherit stdenv;
      systemName = "cl-alc";
      
      sourceProject = "${lisp-project_cl-openal}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-openal}";
      name = "lisp_cl-alc-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
