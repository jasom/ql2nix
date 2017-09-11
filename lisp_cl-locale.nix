
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-locale, 
   lisp_anaphora, lisp_arnesi, lisp_cl-annot, lisp_cl-syntax, lisp_cl-syntax-annot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_arnesi lisp_cl-annot lisp_cl-syntax lisp_cl-syntax-annot  ];
      inherit stdenv;
      systemName = "cl-locale";
      
      sourceProject = "${lisp-project_cl-locale}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_arnesi} ${lisp_cl-annot} ${lisp_cl-syntax} ${lisp_cl-syntax-annot}";
      name = "lisp_cl-locale-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
