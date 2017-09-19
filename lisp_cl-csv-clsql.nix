
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-csv, 
   lisp_data-table-clsql, lisp_clsql-helper,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_data-table-clsql lisp_clsql-helper  ];
      inherit stdenv;
      systemName = "cl-csv-clsql";
      
      sourceProject = "${lisp-project_cl-csv}";
      patches = [];
      lisp_dependencies = "${lisp_data-table-clsql} ${lisp_clsql-helper}";
      name = "lisp_cl-csv-clsql-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
