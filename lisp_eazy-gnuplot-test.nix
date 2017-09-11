
{ buildLispPackage, stdenv, fetchurl, lisp-project_eazy-gnuplot, 
   lisp_eazy-gnuplot, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_eazy-gnuplot lisp_fiveam  ];
      inherit stdenv;
      systemName = "eazy-gnuplot.test";
      
      sourceProject = "${lisp-project_eazy-gnuplot}";
      patches = [];
      lisp_dependencies = "${lisp_eazy-gnuplot} ${lisp_fiveam}";
      name = "lisp_eazy-gnuplot-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
