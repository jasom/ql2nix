
{ buildLispPackage, stdenv, fetchurl, lisp-project_random, 
   lisp_acm-random, lisp_hu-dwim-stefil,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_acm-random lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "acm-random-test";
      
      sourceProject = "${lisp-project_random}";
      patches = [];
      lisp_dependencies = "${lisp_acm-random} ${lisp_hu-dwim-stefil}";
      name = "lisp_acm-random-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
