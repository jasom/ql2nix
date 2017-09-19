
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_closer-mop, lisp_lisp-namespace, lisp_alexandria, lisp_fare-quasiquote-readtable,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_lisp-namespace lisp_alexandria lisp_fare-quasiquote-readtable  ];
      inherit stdenv;
      systemName = "trivia.quasiquote";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_lisp-namespace} ${lisp_alexandria} ${lisp_fare-quasiquote-readtable}";
      name = "lisp_trivia-quasiquote-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
