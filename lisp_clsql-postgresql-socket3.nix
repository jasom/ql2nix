
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql, 
   lisp_cl-postgres, lisp_clsql, lisp_md5,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-postgres lisp_clsql lisp_md5  ];
      inherit stdenv;
      systemName = "clsql-postgresql-socket3";
      
      sourceProject = "${lisp-project_clsql}";
      patches = [];
      lisp_dependencies = "${lisp_cl-postgres} ${lisp_clsql} ${lisp_md5}";
      name = "lisp_clsql-postgresql-socket3-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
