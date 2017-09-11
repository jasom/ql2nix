
{ buildLispPackage, stdenv, fetchurl, lisp-project_climon, 
   lisp_climon, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_climon lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "climon-test";
      
      sourceProject = "${lisp-project_climon}";
      patches = [];
      lisp_dependencies = "${lisp_climon} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_climon-test-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
