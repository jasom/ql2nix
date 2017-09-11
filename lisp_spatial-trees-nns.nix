
{ buildLispPackage, stdenv, fetchurl, lisp-project_spatial-trees, 
   lisp_alexandria, lisp_iterate, lisp_optima, lisp_spatial-trees,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_iterate lisp_optima lisp_spatial-trees  ];
      inherit stdenv;
      systemName = "spatial-trees.nns";
      
      sourceProject = "${lisp-project_spatial-trees}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_iterate} ${lisp_optima} ${lisp_spatial-trees}";
      name = "lisp_spatial-trees-nns-20140826-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
