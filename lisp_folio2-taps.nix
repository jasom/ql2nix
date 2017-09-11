
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio2, 
   lisp_closer-mop, lisp_folio2-as, lisp_folio2-make, lisp_folio2-maps, lisp_folio2-pairs, lisp_folio2-sequences, lisp_folio2-series, lisp_fset,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_folio2-as lisp_folio2-make lisp_folio2-maps lisp_folio2-pairs lisp_folio2-sequences lisp_folio2-series lisp_fset  ];
      inherit stdenv;
      systemName = "folio2-taps";
      
      sourceProject = "${lisp-project_folio2}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_folio2-as} ${lisp_folio2-make} ${lisp_folio2-maps} ${lisp_folio2-pairs} ${lisp_folio2-sequences} ${lisp_folio2-series} ${lisp_fset}";
      name = "lisp_folio2-taps-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
