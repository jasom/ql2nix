
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio2, 
   lisp_folio2-maps, lisp_folio2-maps-syntax, lisp_lift,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_folio2-maps lisp_folio2-maps-syntax lisp_lift  ];
      inherit stdenv;
      systemName = "folio2-maps-tests";
      
      sourceProject = "${lisp-project_folio2}";
      patches = [];
      lisp_dependencies = "${lisp_folio2-maps} ${lisp_folio2-maps-syntax} ${lisp_lift}";
      name = "lisp_folio2-maps-tests-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }