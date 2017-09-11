
{ buildLispPackage, stdenv, fetchurl, lisp-project_spatial-trees, 
   lisp_fiveam, lisp_spatial-trees,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_spatial-trees  ];
      inherit stdenv;
      systemName = "spatial-trees.test";
      
      sourceProject = "${lisp-project_spatial-trees}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_spatial-trees}";
      name = "lisp_spatial-trees-test-20140826-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
