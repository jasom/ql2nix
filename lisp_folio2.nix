
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio2, 
   lisp_alexandria, lisp_folio2-as, lisp_folio2-as-syntax, lisp_folio2-boxes, lisp_folio2-functions, lisp_folio2-functions-syntax, lisp_folio2-make, lisp_folio2-maps, lisp_folio2-maps-syntax, lisp_folio2-pairs, lisp_folio2-sequences, lisp_folio2-sequences-syntax, lisp_folio2-series, lisp_folio2-taps, lisp_fset, lisp_series,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_folio2-as lisp_folio2-as-syntax lisp_folio2-boxes lisp_folio2-functions lisp_folio2-functions-syntax lisp_folio2-make lisp_folio2-maps lisp_folio2-maps-syntax lisp_folio2-pairs lisp_folio2-sequences lisp_folio2-sequences-syntax lisp_folio2-series lisp_folio2-taps lisp_fset lisp_series  ];
      inherit stdenv;
      systemName = "folio2";
      
      sourceProject = "${lisp-project_folio2}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_folio2-as} ${lisp_folio2-as-syntax} ${lisp_folio2-boxes} ${lisp_folio2-functions} ${lisp_folio2-functions-syntax} ${lisp_folio2-make} ${lisp_folio2-maps} ${lisp_folio2-maps-syntax} ${lisp_folio2-pairs} ${lisp_folio2-sequences} ${lisp_folio2-sequences-syntax} ${lisp_folio2-series} ${lisp_folio2-taps} ${lisp_fset} ${lisp_series}";
      name = "lisp_folio2-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
