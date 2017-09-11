
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivialib-bdd, 
   lisp_alexandria, lisp_immutable-struct, lisp_trivia, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_immutable-struct lisp_trivia lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "trivialib.bdd";
      
      sourceProject = "${lisp-project_trivialib-bdd}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_immutable-struct} ${lisp_trivia} ${lisp_trivial-garbage}";
      name = "lisp_trivialib-bdd-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
