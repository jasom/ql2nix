
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_clml-data-r-datasets,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clml-data-r-datasets  ];
      inherit stdenv;
      systemName = "clml.data";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_clml-data-r-datasets}";
      name = "lisp_clml-data-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
