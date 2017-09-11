
{ buildLispPackage, stdenv, fetchurl, lisp-project_ia-hash-table, 
   lisp_alexandria, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_split-sequence  ];
      inherit stdenv;
      systemName = "ia-hash-table";
      
      sourceProject = "${lisp-project_ia-hash-table}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_split-sequence}";
      name = "lisp_ia-hash-table-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
