
{ buildLispPackage, stdenv, fetchurl, lisp-project_ia-hash-table, 
   lisp_split-sequence, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "ia-hash-table";
      
      sourceProject = "${lisp-project_ia-hash-table}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_ia-hash-table-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
