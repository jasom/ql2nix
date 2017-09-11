
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_fiveam, lisp_trivia-cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_trivia-cffi  ];
      inherit stdenv;
      systemName = "trivia.cffi.test";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_trivia-cffi}";
      name = "lisp_trivia-cffi-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
