
{ buildLispPackage, stdenv, fetchurl, lisp-project_latex-table, 
   lisp_alexandria, lisp_anaphora, lisp_array-operations, lisp_let-plus,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_array-operations lisp_let-plus  ];
      inherit stdenv;
      systemName = "latex-table";
      
      sourceProject = "${lisp-project_latex-table}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_array-operations} ${lisp_let-plus}";
      name = "lisp_latex-table-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
