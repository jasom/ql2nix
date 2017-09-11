
{ buildLispPackage, stdenv, fetchurl, lisp-project_iterate-clsql, 
   lisp_clsql, lisp_iterate,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql lisp_iterate  ];
      inherit stdenv;
      systemName = "iterate-clsql";
      
      sourceProject = "${lisp-project_iterate-clsql}";
      patches = [];
      lisp_dependencies = "${lisp_clsql} ${lisp_iterate}";
      name = "lisp_iterate-clsql-20130312-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
