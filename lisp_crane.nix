
{ buildLispPackage, stdenv, fetchurl, lisp-project_crane, 
   lisp_anaphora, lisp_cl-fad, lisp_clos-fixtures, lisp_closer-mop, lisp_dbi, lisp_iterate, lisp_local-time, lisp_sxql,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_cl-fad lisp_clos-fixtures lisp_closer-mop lisp_dbi lisp_iterate lisp_local-time lisp_sxql  ];
      inherit stdenv;
      systemName = "crane";
      
      sourceProject = "${lisp-project_crane}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_cl-fad} ${lisp_clos-fixtures} ${lisp_closer-mop} ${lisp_dbi} ${lisp_iterate} ${lisp_local-time} ${lisp_sxql}";
      name = "lisp_crane-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
