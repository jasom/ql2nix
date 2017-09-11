
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-locale, 
   lisp_cl-locale, lisp_cl-syntax,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-locale lisp_cl-syntax  ];
      inherit stdenv;
      systemName = "cl-locale-syntax";
      
      sourceProject = "${lisp-project_cl-locale}";
      patches = [];
      lisp_dependencies = "${lisp_cl-locale} ${lisp_cl-syntax}";
      name = "lisp_cl-locale-syntax-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
