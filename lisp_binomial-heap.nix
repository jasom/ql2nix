
{ buildLispPackage, stdenv, fetchurl, lisp-project_binomial-heap, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "binomial-heap";
      
      sourceProject = "${lisp-project_binomial-heap}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_binomial-heap-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
