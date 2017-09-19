
{ buildLispPackage, stdenv, fetchurl, lisp-project_integral, 
   lisp_group-by, lisp_clos-fixtures, lisp_cl-ppcre, lisp_dbi, lisp_sxql, lisp_cl-syntax-annot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_group-by lisp_clos-fixtures lisp_cl-ppcre lisp_dbi lisp_sxql lisp_cl-syntax-annot  ];
      inherit stdenv;
      systemName = "integral";
      
      sourceProject = "${lisp-project_integral}";
      patches = [];
      lisp_dependencies = "${lisp_group-by} ${lisp_clos-fixtures} ${lisp_cl-ppcre} ${lisp_dbi} ${lisp_sxql} ${lisp_cl-syntax-annot}";
      name = "lisp_integral-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
