
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-locale, 
   lisp_cl-locale, lisp_cl-syntax, lisp_flexi-streams, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-locale lisp_cl-syntax lisp_flexi-streams lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-locale-test";
      
      sourceProject = "${lisp-project_cl-locale}";
      patches = [];
      lisp_dependencies = "${lisp_cl-locale} ${lisp_cl-syntax} ${lisp_flexi-streams} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-locale-test-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
