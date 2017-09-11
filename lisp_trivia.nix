
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_trivia-level2,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivia-level2  ];
      inherit stdenv;
      systemName = "trivia";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_trivia-level2}";
      name = "lisp_trivia-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
