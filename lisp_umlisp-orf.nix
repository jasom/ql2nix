
{ buildLispPackage, stdenv, fetchurl, lisp-project_umlisp-orf, 
   lisp_clsql, lisp_clsql-postgresql-socket, lisp_hyperobject, lisp_kmrcl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql lisp_clsql-postgresql-socket lisp_hyperobject lisp_kmrcl  ];
      inherit stdenv;
      systemName = "umlisp-orf";
      
      sourceProject = "${lisp-project_umlisp-orf}";
      patches = [];
      lisp_dependencies = "${lisp_clsql} ${lisp_clsql-postgresql-socket} ${lisp_hyperobject} ${lisp_kmrcl}";
      name = "lisp_umlisp-orf-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
