
{ buildLispPackage, stdenv, fetchurl, lisp-project_latex-table, 
   lisp_array-operations, lisp_anaphora, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_array-operations lisp_anaphora lisp_alexandria  ];
      inherit stdenv;
      systemName = "latex-table";
      
      sourceProject = "${lisp-project_latex-table}";
      patches = [];
      lisp_dependencies = "${lisp_array-operations} ${lisp_anaphora} ${lisp_alexandria}";
      name = "lisp_latex-table-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
