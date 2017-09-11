
{ buildLispPackage, stdenv, fetchurl, lisp-project_random-sample, 
   lisp_alexandria, lisp_infix-math, lisp_serapeum,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_infix-math lisp_serapeum  ];
      inherit stdenv;
      systemName = "random-sample";
      
      sourceProject = "${lisp-project_random-sample}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_infix-math} ${lisp_serapeum}";
      name = "lisp_random-sample-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
