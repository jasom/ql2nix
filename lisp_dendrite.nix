
{ buildLispPackage, stdenv, fetchurl, lisp-project_dendrite, 
   lisp_cffi, lisp_rtg-math,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_rtg-math  ];
      inherit stdenv;
      systemName = "dendrite";
      
      sourceProject = "${lisp-project_dendrite}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_rtg-math}";
      name = "lisp_dendrite-release-quicklisp-662aedba-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
