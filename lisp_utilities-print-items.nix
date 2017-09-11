
{ buildLispPackage, stdenv, fetchurl, lisp-project_utilities-print-items, 
   lisp_alexandria, lisp_iterate, lisp_let-plus,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_iterate lisp_let-plus  ];
      inherit stdenv;
      systemName = "utilities.print-items";
      
      sourceProject = "${lisp-project_utilities-print-items}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_iterate} ${lisp_let-plus}";
      name = "lisp_utilities-print-items-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
