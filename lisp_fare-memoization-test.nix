
{ buildLispPackage, stdenv, fetchurl, lisp-project_fare-memoization, 
   lisp_hu-dwim-stefil,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "fare-memoization/test";
      
      sourceProject = "${lisp-project_fare-memoization}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil}";
      name = "lisp_fare-memoization-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
