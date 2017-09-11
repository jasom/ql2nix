
{ buildLispPackage, stdenv, fetchurl, lisp-project_skitter, 
   lisp_structy-defclass, lisp_rtg-math,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_structy-defclass lisp_rtg-math  ];
      inherit stdenv;
      systemName = "skitter";
      
      sourceProject = "${lisp-project_skitter}";
      patches = [];
      lisp_dependencies = "${lisp_structy-defclass} ${lisp_rtg-math}";
      name = "lisp_skitter-release-quicklisp-dd15a0b5-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
