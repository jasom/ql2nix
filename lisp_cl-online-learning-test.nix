
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-online-learning, 
   lisp_cl-online-learning, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-online-learning lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-online-learning-test";
      
      sourceProject = "${lisp-project_cl-online-learning}";
      patches = [];
      lisp_dependencies = "${lisp_cl-online-learning} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-online-learning-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
