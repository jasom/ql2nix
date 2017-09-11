
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_clml-hjs, lisp_array-operations,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clml-hjs lisp_array-operations  ];
      inherit stdenv;
      systemName = "clml.time-series";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_clml-hjs} ${lisp_array-operations}";
      name = "lisp_clml-time-series-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
