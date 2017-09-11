
{ buildLispPackage, stdenv, fetchurl, lisp-project_quri, 
   lisp_prove, lisp_prove-asdf, lisp_quri,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove lisp_prove-asdf lisp_quri  ];
      inherit stdenv;
      systemName = "quri-test";
      
      sourceProject = "${lisp-project_quri}";
      patches = [];
      lisp_dependencies = "${lisp_prove} ${lisp_prove-asdf} ${lisp_quri}";
      name = "lisp_quri-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
