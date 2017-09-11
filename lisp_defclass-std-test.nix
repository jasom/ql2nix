
{ buildLispPackage, stdenv, fetchurl, lisp-project_defclass-std, 
   lisp_defclass-std, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_defclass-std lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "defclass-std-test";
      
      sourceProject = "${lisp-project_defclass-std}";
      patches = [];
      lisp_dependencies = "${lisp_defclass-std} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_defclass-std-test-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }