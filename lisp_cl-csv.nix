
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-csv, 
   lisp_cl-interpol, lisp_alexandria, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-interpol lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-csv";
      
      sourceProject = "${lisp-project_cl-csv}";
      patches = [];
      lisp_dependencies = "${lisp_cl-interpol} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_cl-csv-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
