
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_clml-hjs, lisp_clml-decision-tree,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clml-hjs lisp_clml-decision-tree  ];
      inherit stdenv;
      systemName = "clml.clustering";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_clml-hjs} ${lisp_clml-decision-tree}";
      name = "lisp_clml-clustering-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
