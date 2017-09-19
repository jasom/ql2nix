
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-graph, 
   lisp_hu-dwim-graphviz, lisp_metabang-bind, lisp_cl-containers, lisp_metatilities-base,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-graphviz lisp_metabang-bind lisp_cl-containers lisp_metatilities-base  ];
      inherit stdenv;
      systemName = "cl-graph+hu.dwim.graphviz";
      
      sourceProject = "${lisp-project_cl-graph}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-graphviz} ${lisp_metabang-bind} ${lisp_cl-containers} ${lisp_metatilities-base}";
      name = "lisp_cl-graph-hu-dwim-graphviz-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
