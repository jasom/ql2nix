
{ buildLispPackage, stdenv, fetchurl, lisp-project_colliflower, 
   lisp_asdf-package-system, lisp_garten, lisp_liter,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-package-system lisp_garten lisp_liter  ];
      inherit stdenv;
      systemName = "colliflower";
      
      sourceProject = "${lisp-project_colliflower}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-package-system} ${lisp_garten} ${lisp_liter}";
      name = "lisp_colliflower-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
