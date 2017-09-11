
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_iterate, lisp_optima, lisp_trivia, lisp_trivia-balland2006,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_optima lisp_trivia lisp_trivia-balland2006  ];
      inherit stdenv;
      systemName = "trivia.benchmark";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_optima} ${lisp_trivia} ${lisp_trivia-balland2006}";
      name = "lisp_trivia-benchmark-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
