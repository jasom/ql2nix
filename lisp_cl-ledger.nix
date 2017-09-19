
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ledger, 
   lisp_cl-ppcre, lisp_cambl, lisp_periods-series, lisp_local-time,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cambl lisp_periods-series lisp_local-time  ];
      inherit stdenv;
      systemName = "cl-ledger";
      
      sourceProject = "${lisp-project_cl-ledger}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cambl} ${lisp_periods-series} ${lisp_local-time}";
      name = "lisp_cl-ledger-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
