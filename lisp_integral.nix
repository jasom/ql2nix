
{ buildLispPackage, stdenv, fetchurl, lisp-project_integral, 
   lisp_alexandria, lisp_cl-ppcre, lisp_cl-syntax-annot, lisp_clos-fixtures, lisp_closer-mop, lisp_dbi, lisp_group-by, lisp_iterate, lisp_split-sequence, lisp_sxql, lisp_trivial-types,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_cl-syntax-annot lisp_clos-fixtures lisp_closer-mop lisp_dbi lisp_group-by lisp_iterate lisp_split-sequence lisp_sxql lisp_trivial-types  ];
      inherit stdenv;
      systemName = "integral";
      
      sourceProject = "${lisp-project_integral}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_cl-syntax-annot} ${lisp_clos-fixtures} ${lisp_closer-mop} ${lisp_dbi} ${lisp_group-by} ${lisp_iterate} ${lisp_split-sequence} ${lisp_sxql} ${lisp_trivial-types}";
      name = "lisp_integral-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
