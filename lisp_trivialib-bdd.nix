
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivialib-bdd, 
   lisp_immutable-struct, lisp_trivial-garbage, lisp_trivia, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_immutable-struct lisp_trivial-garbage lisp_trivia lisp_alexandria  ];
      inherit stdenv;
      systemName = "trivialib.bdd";
      
      sourceProject = "${lisp-project_trivialib-bdd}";
      patches = [];
      lisp_dependencies = "${lisp_immutable-struct} ${lisp_trivial-garbage} ${lisp_trivia} ${lisp_alexandria}";
      name = "lisp_trivialib-bdd-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
