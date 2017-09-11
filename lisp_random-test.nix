
{ buildLispPackage, stdenv, fetchurl, lisp-project_random, 
   lisp_hu-dwim-stefil, lisp_random,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil lisp_random  ];
      inherit stdenv;
      systemName = "random-test";
      
      sourceProject = "${lisp-project_random}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil} ${lisp_random}";
      name = "lisp_random-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
