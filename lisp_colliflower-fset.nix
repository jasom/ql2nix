
{ buildLispPackage, stdenv, fetchurl, lisp-project_colliflower, 
   lisp_serapeum, lisp_iterate, lisp_fset,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_serapeum lisp_iterate lisp_fset  ];
      inherit stdenv;
      systemName = "colliflower-fset";
      
      sourceProject = "${lisp-project_colliflower}";
      patches = [];
      lisp_dependencies = "${lisp_serapeum} ${lisp_iterate} ${lisp_fset}";
      name = "lisp_colliflower-fset-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
