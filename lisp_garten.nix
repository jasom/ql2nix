
{ buildLispPackage, stdenv, fetchurl, lisp-project_colliflower, 
   lisp_serapeum, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_serapeum lisp_iterate  ];
      inherit stdenv;
      systemName = "garten";
      
      sourceProject = "${lisp-project_colliflower}";
      patches = [];
      lisp_dependencies = "${lisp_serapeum} ${lisp_iterate}";
      name = "lisp_garten-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
