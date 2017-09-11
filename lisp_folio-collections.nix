
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio, 
   lisp_folio-as, lisp_folio-functions, lisp_fset,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_folio-as lisp_folio-functions lisp_fset  ];
      inherit stdenv;
      systemName = "folio.collections";
      
      sourceProject = "${lisp-project_folio}";
      patches = [];
      lisp_dependencies = "${lisp_folio-as} ${lisp_folio-functions} ${lisp_fset}";
      name = "lisp_folio-collections-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }