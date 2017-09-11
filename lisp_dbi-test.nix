
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-dbi, 
   lisp_cl-syntax, lisp_cl-syntax-annot, lisp_closer-mop, lisp_dbi, lisp_prove, lisp_trivial-types,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax lisp_cl-syntax-annot lisp_closer-mop lisp_dbi lisp_prove lisp_trivial-types  ];
      inherit stdenv;
      systemName = "dbi-test";
      
      sourceProject = "${lisp-project_cl-dbi}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax} ${lisp_cl-syntax-annot} ${lisp_closer-mop} ${lisp_dbi} ${lisp_prove} ${lisp_trivial-types}";
      name = "lisp_dbi-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
