
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio2, 
   lisp_folio2-as, lisp_folio2-make,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_folio2-as lisp_folio2-make  ];
      inherit stdenv;
      systemName = "folio2-boxes";
      
      sourceProject = "${lisp-project_folio2}";
      patches = [];
      lisp_dependencies = "${lisp_folio2-as} ${lisp_folio2-make}";
      name = "lisp_folio2-boxes-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
