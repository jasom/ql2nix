
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_fare-quasiquote-readtable, lisp_trivia,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-quasiquote-readtable lisp_trivia  ];
      inherit stdenv;
      systemName = "trivia.quasiquote";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_fare-quasiquote-readtable} ${lisp_trivia}";
      name = "lisp_trivia-quasiquote-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
