
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio2, 
   lisp_alexandria, lisp_folio2-functions,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_folio2-functions  ];
      inherit stdenv;
      systemName = "folio2-functions-syntax";
      
      sourceProject = "${lisp-project_folio2}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_folio2-functions}";
      name = "lisp_folio2-functions-syntax-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
