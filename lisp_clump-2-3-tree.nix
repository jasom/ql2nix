
{ buildLispPackage, stdenv, fetchurl, lisp-project_clump, 
   lisp_acclimation,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_acclimation  ];
      inherit stdenv;
      systemName = "clump-2-3-tree";
      
      sourceProject = "${lisp-project_clump}";
      patches = [];
      lisp_dependencies = "${lisp_acclimation}";
      name = "lisp_clump-2-3-tree-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
