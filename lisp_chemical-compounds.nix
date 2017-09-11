
{ buildLispPackage, stdenv, fetchurl, lisp-project_chemical-compounds, 
   lisp_periodic-table,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_periodic-table  ];
      inherit stdenv;
      systemName = "chemical-compounds";
      
      sourceProject = "${lisp-project_chemical-compounds}";
      patches = [];
      lisp_dependencies = "${lisp_periodic-table}";
      name = "lisp_chemical-compounds-1.0.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
