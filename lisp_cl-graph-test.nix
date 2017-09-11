
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-graph, 
   lisp_cl-graph, lisp_lift,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-graph lisp_lift  ];
      inherit stdenv;
      systemName = "cl-graph-test";
      
      sourceProject = "${lisp-project_cl-graph}";
      patches = [];
      lisp_dependencies = "${lisp_cl-graph} ${lisp_lift}";
      name = "lisp_cl-graph-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
