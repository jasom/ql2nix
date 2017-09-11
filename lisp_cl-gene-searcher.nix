
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gene-searcher, 
   lisp_clsql-sqlite3,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql-sqlite3  ];
      inherit stdenv;
      systemName = "cl-gene-searcher";
      
      sourceProject = "${lisp-project_cl-gene-searcher}";
      patches = [];
      lisp_dependencies = "${lisp_clsql-sqlite3}";
      name = "lisp_cl-gene-searcher-20111001-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
