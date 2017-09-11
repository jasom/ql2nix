
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mustache, 
   lisp_cl-mustache, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mustache lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-mustache-test";
      
      sourceProject = "${lisp-project_cl-mustache}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mustache} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-mustache-test-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
