
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_clml-hjs,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clml-hjs  ];
      inherit stdenv;
      systemName = "clml.nonparametric";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_clml-hjs}";
      name = "lisp_clml-nonparametric-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
