
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fluidinfo, 
   lisp_cl-fluiddb, lisp_lift,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fluiddb lisp_lift  ];
      inherit stdenv;
      systemName = "cl-fluiddb-test";
      
      sourceProject = "${lisp-project_cl-fluidinfo}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fluiddb} ${lisp_lift}";
      name = "lisp_cl-fluiddb-test-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
