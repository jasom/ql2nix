
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-syntax, 
   lisp_clsql, lisp_named-readtables, lisp_trivial-types,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql lisp_named-readtables lisp_trivial-types  ];
      inherit stdenv;
      systemName = "cl-syntax-clsql";
      
      sourceProject = "${lisp-project_cl-syntax}";
      patches = [];
      lisp_dependencies = "${lisp_clsql} ${lisp_named-readtables} ${lisp_trivial-types}";
      name = "lisp_cl-syntax-clsql-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
