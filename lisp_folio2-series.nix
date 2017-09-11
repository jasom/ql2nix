
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio2, 
   lisp_folio2-as, lisp_folio2-make, lisp_folio2-pairs, lisp_folio2-sequences, lisp_fset, lisp_series,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_folio2-as lisp_folio2-make lisp_folio2-pairs lisp_folio2-sequences lisp_fset lisp_series  ];
      inherit stdenv;
      systemName = "folio2-series";
      
      sourceProject = "${lisp-project_folio2}";
      patches = [];
      lisp_dependencies = "${lisp_folio2-as} ${lisp_folio2-make} ${lisp_folio2-pairs} ${lisp_folio2-sequences} ${lisp_fset} ${lisp_series}";
      name = "lisp_folio2-series-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
