
{ buildLispPackage, stdenv, fetchurl, lisp-project_snappy, 
   lisp_acm-random, lisp_hu-dwim-stefil, lisp_nibbles, lisp_snappy,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_acm-random lisp_hu-dwim-stefil lisp_nibbles lisp_snappy  ];
      inherit stdenv;
      systemName = "snappy-test";
      
      sourceProject = "${lisp-project_snappy}";
      patches = [];
      lisp_dependencies = "${lisp_acm-random} ${lisp_hu-dwim-stefil} ${lisp_nibbles} ${lisp_snappy}";
      name = "lisp_snappy-test-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
