
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia-balland2006, 
   lisp_trivia-balland2006-enabled, lisp_trivia-level2-test,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivia-balland2006-enabled lisp_trivia-level2-test  ];
      inherit stdenv;
      systemName = "trivia.balland2006.enabled.test";
      
      sourceProject = "${lisp-project_trivia-balland2006}";
      patches = [];
      lisp_dependencies = "${lisp_trivia-balland2006-enabled} ${lisp_trivia-level2-test}";
      name = "lisp_trivia-balland2006-enabled-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
