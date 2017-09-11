
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "clml.statistics.rand";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_clml-statistics-rand-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
