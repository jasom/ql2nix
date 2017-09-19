
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_trivia-balland2006, lisp_optima, lisp_closer-mop, lisp_lisp-namespace, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivia-balland2006 lisp_optima lisp_closer-mop lisp_lisp-namespace lisp_alexandria  ];
      inherit stdenv;
      systemName = "trivia.benchmark";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_trivia-balland2006} ${lisp_optima} ${lisp_closer-mop} ${lisp_lisp-namespace} ${lisp_alexandria}";
      name = "lisp_trivia-benchmark-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
