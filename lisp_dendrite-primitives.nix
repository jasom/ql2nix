
{ buildLispPackage, stdenv, fetchurl, lisp-project_dendrite, 
   lisp_rtg-math, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rtg-math lisp_cffi  ];
      inherit stdenv;
      systemName = "dendrite.primitives";
      
      sourceProject = "${lisp-project_dendrite}";
      patches = [];
      lisp_dependencies = "${lisp_rtg-math} ${lisp_cffi}";
      name = "lisp_dendrite-primitives-release-quicklisp-662aedba-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
