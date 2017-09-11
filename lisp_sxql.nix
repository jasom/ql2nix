
{ buildLispPackage, stdenv, fetchurl, lisp-project_sxql, 
   lisp_alexandria, lisp_cl-syntax-annot, lisp_iterate, lisp_optima, lisp_split-sequence, lisp_trivial-types,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-syntax-annot lisp_iterate lisp_optima lisp_split-sequence lisp_trivial-types  ];
      inherit stdenv;
      systemName = "sxql";
      
      sourceProject = "${lisp-project_sxql}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-syntax-annot} ${lisp_iterate} ${lisp_optima} ${lisp_split-sequence} ${lisp_trivial-types}";
      name = "lisp_sxql-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
