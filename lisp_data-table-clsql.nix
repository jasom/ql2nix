
{ buildLispPackage, stdenv, fetchurl, lisp-project_data-table, 
   lisp_clsql-helper, lisp_clsql, lisp_iterate,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql-helper lisp_clsql lisp_iterate  ];
      inherit stdenv;
      systemName = "data-table-clsql";
      
      sourceProject = "${lisp-project_data-table}";
      patches = [];
      lisp_dependencies = "${lisp_clsql-helper} ${lisp_clsql} ${lisp_iterate}";
      name = "lisp_data-table-clsql-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
