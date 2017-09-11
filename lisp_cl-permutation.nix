
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-permutation, 
   lisp_alexandria, lisp_cl-algebraic-data-type, lisp_closer-mop, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-algebraic-data-type lisp_closer-mop lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-permutation";
      
      sourceProject = "${lisp-project_cl-permutation}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-algebraic-data-type} ${lisp_closer-mop} ${lisp_iterate}";
      name = "lisp_cl-permutation-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
