
{ buildLispPackage, stdenv, fetchurl, lisp-project_eazy-gnuplot, 
   lisp_trivia, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivia lisp_iterate  ];
      inherit stdenv;
      systemName = "eazy-gnuplot";
      
      sourceProject = "${lisp-project_eazy-gnuplot}";
      patches = [];
      lisp_dependencies = "${lisp_trivia} ${lisp_iterate}";
      name = "lisp_eazy-gnuplot-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
