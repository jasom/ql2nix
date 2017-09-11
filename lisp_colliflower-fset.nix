
{ buildLispPackage, stdenv, fetchurl, lisp-project_colliflower, 
   lisp_colliflower, lisp_fset,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_colliflower lisp_fset  ];
      inherit stdenv;
      systemName = "colliflower-fset";
      
      sourceProject = "${lisp-project_colliflower}";
      patches = [];
      lisp_dependencies = "${lisp_colliflower} ${lisp_fset}";
      name = "lisp_colliflower-fset-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
