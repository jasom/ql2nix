
{ buildLispPackage, stdenv, fetchurl, lisp-project_iterate-clsql, 
   lisp_iterate, lisp_clsql,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_clsql  ];
      inherit stdenv;
      systemName = "iterate-clsql";
      
      sourceProject = "${lisp-project_iterate-clsql}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_clsql}";
      name = "lisp_iterate-clsql-20130312-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
