
{ buildLispPackage, stdenv, fetchurl, lisp-project_random-sample, 
   lisp_infix-math, lisp_serapeum, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_infix-math lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "random-sample";
      
      sourceProject = "${lisp-project_random-sample}";
      patches = [];
      lisp_dependencies = "${lisp_infix-math} ${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_random-sample-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
