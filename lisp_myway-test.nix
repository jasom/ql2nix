
{ buildLispPackage, stdenv, fetchurl, lisp-project_myway, 
   lisp_myway, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_myway lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "myway-test";
      
      sourceProject = "${lisp-project_myway}";
      patches = [];
      lisp_dependencies = "${lisp_myway} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_myway-test-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
