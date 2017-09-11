
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivialib-type-unify, 
   lisp_alexandria, lisp_introspect-environment, lisp_trivia, lisp_type-r,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_introspect-environment lisp_trivia lisp_type-r  ];
      inherit stdenv;
      systemName = "trivialib.type-unify";
      
      sourceProject = "${lisp-project_trivialib-type-unify}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_introspect-environment} ${lisp_trivia} ${lisp_type-r}";
      name = "lisp_trivialib-type-unify-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
