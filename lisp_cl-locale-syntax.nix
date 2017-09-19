
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-locale, 
   lisp_cl-syntax-annot, lisp_cl-syntax, lisp_cl-annot, lisp_arnesi, lisp_anaphora,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax-annot lisp_cl-syntax lisp_cl-annot lisp_arnesi lisp_anaphora  ];
      inherit stdenv;
      systemName = "cl-locale-syntax";
      
      sourceProject = "${lisp-project_cl-locale}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax-annot} ${lisp_cl-syntax} ${lisp_cl-annot} ${lisp_arnesi} ${lisp_anaphora}";
      name = "lisp_cl-locale-syntax-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
