
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio, 
   lisp_folio-as, lisp_folio-boxes, lisp_folio-collections, lisp_folio-functions,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_folio-as lisp_folio-boxes lisp_folio-collections lisp_folio-functions  ];
      inherit stdenv;
      systemName = "folio";
      
      sourceProject = "${lisp-project_folio}";
      patches = [];
      lisp_dependencies = "${lisp_folio-as} ${lisp_folio-boxes} ${lisp_folio-collections} ${lisp_folio-functions}";
      name = "lisp_folio-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
