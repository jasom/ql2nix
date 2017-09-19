
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-csv, 
   lisp_data-table, lisp_cl-interpol, lisp_alexandria, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_data-table lisp_cl-interpol lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-csv-data-table";
      
      sourceProject = "${lisp-project_cl-csv}";
      patches = [];
      lisp_dependencies = "${lisp_data-table} ${lisp_cl-interpol} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_cl-csv-data-table-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
