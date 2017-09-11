
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-annot-prove, 
   lisp_cl-fad, lisp_cl-ppcre, lisp_cl-syntax, lisp_cl-syntax-annot, lisp_prove, lisp_trivial-types,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-ppcre lisp_cl-syntax lisp_cl-syntax-annot lisp_prove lisp_trivial-types  ];
      inherit stdenv;
      systemName = "cl-annot-prove";
      
      sourceProject = "${lisp-project_cl-annot-prove}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_cl-syntax} ${lisp_cl-syntax-annot} ${lisp_prove} ${lisp_trivial-types}";
      name = "lisp_cl-annot-prove-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
