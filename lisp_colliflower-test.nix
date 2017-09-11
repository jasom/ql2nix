
{ buildLispPackage, stdenv, fetchurl, lisp-project_colliflower, 
   lisp_colliflower, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_colliflower lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "colliflower-test";
      
      sourceProject = "${lisp-project_colliflower}";
      patches = [];
      lisp_dependencies = "${lisp_colliflower} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_colliflower-test-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
