
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio2, 
   lisp_folio2,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_folio2  ];
      inherit stdenv;
      systemName = "folio2-tests";
      
      sourceProject = "${lisp-project_folio2}";
      patches = [];
      lisp_dependencies = "${lisp_folio2}";
      name = "lisp_folio2-tests-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
