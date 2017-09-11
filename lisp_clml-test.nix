
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_lisp-unit, lisp_clml-hjs, lisp_clml-decision-tree, lisp_clml-time-series,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-unit lisp_clml-hjs lisp_clml-decision-tree lisp_clml-time-series  ];
      inherit stdenv;
      systemName = "clml.test";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-unit} ${lisp_clml-hjs} ${lisp_clml-decision-tree} ${lisp_clml-time-series}";
      name = "lisp_clml-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
