
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_cl-ppcre, lisp_trivia-level2,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_trivia-level2  ];
      inherit stdenv;
      systemName = "trivia.ppcre";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_trivia-level2}";
      name = "lisp_trivia-ppcre-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
