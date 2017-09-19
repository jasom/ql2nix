
{ buildLispPackage, stdenv, fetchurl, lisp-project_folio2, 
   lisp_series, lisp_fset,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_series lisp_fset  ];
      inherit stdenv;
      systemName = "folio2-sequences-syntax";
      
      sourceProject = "${lisp-project_folio2}";
      patches = [];
      lisp_dependencies = "${lisp_series} ${lisp_fset}";
      name = "lisp_folio2-sequences-syntax-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
