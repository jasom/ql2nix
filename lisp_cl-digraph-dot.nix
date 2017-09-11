
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-digraph, 
   lisp_cl-dot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-dot  ];
      inherit stdenv;
      systemName = "cl-digraph.dot";
      
      sourceProject = "${lisp-project_cl-digraph}";
      patches = [];
      lisp_dependencies = "${lisp_cl-dot}";
      name = "lisp_cl-digraph-dot-20170630-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
