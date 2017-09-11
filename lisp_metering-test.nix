
{ buildLispPackage, stdenv, fetchurl, lisp-project_metering, 
   lisp_fiveam, lisp_metering,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_metering  ];
      inherit stdenv;
      systemName = "metering/test";
      
      sourceProject = "${lisp-project_metering}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_metering}";
      name = "lisp_metering-test-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
