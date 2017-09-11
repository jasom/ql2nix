
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-shellwords, 
   lisp_cl-shellwords, lisp_prove,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-shellwords lisp_prove  ];
      inherit stdenv;
      systemName = "cl-shellwords-test";
      
      sourceProject = "${lisp-project_cl-shellwords}";
      patches = [];
      lisp_dependencies = "${lisp_cl-shellwords} ${lisp_prove}";
      name = "lisp_cl-shellwords-test-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
