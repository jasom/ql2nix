
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql, 
  sqlite,   lisp_clsql, lisp_clsql-uffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql lisp_clsql-uffi sqlite ];
      inherit stdenv;
      systemName = "clsql-sqlite3";
      
      sourceProject = "${lisp-project_clsql}";
      patches = [];
      lisp_dependencies = "${lisp_clsql} ${lisp_clsql-uffi}";
      name = "lisp_clsql-sqlite3-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
