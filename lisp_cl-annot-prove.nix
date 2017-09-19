
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-annot-prove, 
   lisp_cl-fad, lisp_prove, lisp_cl-ppcre, lisp_cl-syntax-annot, lisp_cl-syntax,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_prove lisp_cl-ppcre lisp_cl-syntax-annot lisp_cl-syntax  ];
      inherit stdenv;
      systemName = "cl-annot-prove";
      
      sourceProject = "${lisp-project_cl-annot-prove}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_prove} ${lisp_cl-ppcre} ${lisp_cl-syntax-annot} ${lisp_cl-syntax}";
      name = "lisp_cl-annot-prove-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
