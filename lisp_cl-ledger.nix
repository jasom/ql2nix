
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ledger, 
   lisp_local-time, lisp_periods-series, lisp_cambl, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_periods-series lisp_cambl lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-ledger";
      
      sourceProject = "${lisp-project_cl-ledger}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_periods-series} ${lisp_cambl} ${lisp_cl-ppcre}";
      name = "lisp_cl-ledger-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
