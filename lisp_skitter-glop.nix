
{ buildLispPackage, stdenv, fetchurl, lisp-project_skitter, 
   lisp_glop, lisp_rtg-math, lisp_structy-defclass,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glop lisp_rtg-math lisp_structy-defclass  ];
      inherit stdenv;
      systemName = "skitter.glop";
      
      sourceProject = "${lisp-project_skitter}";
      patches = [];
      lisp_dependencies = "${lisp_glop} ${lisp_rtg-math} ${lisp_structy-defclass}";
      name = "lisp_skitter-glop-release-quicklisp-da731855-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
