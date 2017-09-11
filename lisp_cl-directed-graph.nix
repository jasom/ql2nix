
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-directed-graph, 
   lisp_serapeum,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_serapeum  ];
      inherit stdenv;
      systemName = "cl-directed-graph";
      
      sourceProject = "${lisp-project_cl-directed-graph}";
      patches = [];
      lisp_dependencies = "${lisp_serapeum}";
      name = "lisp_cl-directed-graph-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
