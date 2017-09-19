
{ buildLispPackage, stdenv, fetchurl, lisp-project_skitter, 
   lisp_rtg-math, lisp_structy-defclass,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rtg-math lisp_structy-defclass  ];
      inherit stdenv;
      systemName = "skitter";
      
      sourceProject = "${lisp-project_skitter}";
      patches = [];
      lisp_dependencies = "${lisp_rtg-math} ${lisp_structy-defclass}";
      name = "lisp_skitter-release-quicklisp-da731855-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
