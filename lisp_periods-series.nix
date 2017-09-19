
{ buildLispPackage, stdenv, fetchurl, lisp-project_periods, 
   lisp_series, lisp_local-time,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_series lisp_local-time  ];
      inherit stdenv;
      systemName = "periods-series";
      
      sourceProject = "${lisp-project_periods}";
      patches = [];
      lisp_dependencies = "${lisp_series} ${lisp_local-time}";
      name = "lisp_periods-series-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
