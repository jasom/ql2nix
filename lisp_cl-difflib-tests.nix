
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-difflib, 
   lisp_cl-difflib,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-difflib  ];
      inherit stdenv;
      systemName = "cl-difflib-tests";
      
      sourceProject = "${lisp-project_cl-difflib}";
      patches = [];
      lisp_dependencies = "${lisp_cl-difflib}";
      name = "lisp_cl-difflib-tests-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
