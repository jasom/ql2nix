
{ buildLispPackage, stdenv, fetchurl, lisp-project_prove, 
   lisp_prove,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove  ];
      inherit stdenv;
      systemName = "cl-test-more";
      
      sourceProject = "${lisp-project_prove}";
      patches = [];
      lisp_dependencies = "${lisp_prove}";
      name = "lisp_cl-test-more-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
