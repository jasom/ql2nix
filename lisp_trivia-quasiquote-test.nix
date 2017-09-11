
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_fiveam, lisp_trivia-quasiquote,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_trivia-quasiquote  ];
      inherit stdenv;
      systemName = "trivia.quasiquote.test";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_trivia-quasiquote}";
      name = "lisp_trivia-quasiquote-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
