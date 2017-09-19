
{ buildLispPackage, stdenv, fetchurl, lisp-project_perlre, 
   lisp_optima, lisp_prove, lisp_let-over-lambda, lisp_cl-interpol, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_optima lisp_prove lisp_let-over-lambda lisp_cl-interpol lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "perlre";
      
      sourceProject = "${lisp-project_perlre}";
      patches = [];
      lisp_dependencies = "${lisp_optima} ${lisp_prove} ${lisp_let-over-lambda} ${lisp_cl-interpol} ${lisp_cl-ppcre}";
      name = "lisp_perlre-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
