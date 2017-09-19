
{ buildLispPackage, stdenv, fetchurl, lisp-project_crane, 
   lisp_local-time, lisp_clos-fixtures, lisp_cl-fad, lisp_dbi, lisp_sxql, lisp_anaphora, lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_clos-fixtures lisp_cl-fad lisp_dbi lisp_sxql lisp_anaphora lisp_closer-mop  ];
      inherit stdenv;
      systemName = "crane";
      
      sourceProject = "${lisp-project_crane}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_clos-fixtures} ${lisp_cl-fad} ${lisp_dbi} ${lisp_sxql} ${lisp_anaphora} ${lisp_closer-mop}";
      name = "lisp_crane-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
