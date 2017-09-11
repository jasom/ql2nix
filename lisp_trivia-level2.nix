
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_closer-mop, lisp_lisp-namespace, lisp_trivia-level1,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_lisp-namespace lisp_trivia-level1  ];
      inherit stdenv;
      systemName = "trivia.level2";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_lisp-namespace} ${lisp_trivia-level1}";
      name = "lisp_trivia-level2-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
