
{ buildLispPackage, stdenv, fetchurl, lisp-project_data-table, 
   lisp_cl-interpol, lisp_symbol-munger, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-interpol lisp_symbol-munger lisp_iterate  ];
      inherit stdenv;
      systemName = "data-table";
      
      sourceProject = "${lisp-project_data-table}";
      patches = [];
      lisp_dependencies = "${lisp_cl-interpol} ${lisp_symbol-munger} ${lisp_iterate}";
      name = "lisp_data-table-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
