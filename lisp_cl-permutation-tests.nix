
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-permutation, 
   lisp_cl-permutation, lisp_cl-permutation-examples, lisp_fiasco,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-permutation lisp_cl-permutation-examples lisp_fiasco  ];
      inherit stdenv;
      systemName = "cl-permutation-tests";
      
      sourceProject = "${lisp-project_cl-permutation}";
      patches = [];
      lisp_dependencies = "${lisp_cl-permutation} ${lisp_cl-permutation-examples} ${lisp_fiasco}";
      name = "lisp_cl-permutation-tests-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
