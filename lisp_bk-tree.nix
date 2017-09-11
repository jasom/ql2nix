
{ buildLispPackage, stdenv, fetchurl, lisp-project_bk-tree, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "bk-tree";
      
      sourceProject = "${lisp-project_bk-tree}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_bk-tree-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
