
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-digraph, 
   lisp_1am,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_1am  ];
      inherit stdenv;
      systemName = "cl-digraph.test";
      
      sourceProject = "${lisp-project_cl-digraph}";
      patches = [];
      lisp_dependencies = "${lisp_1am}";
      name = "lisp_cl-digraph-test-20170630-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
