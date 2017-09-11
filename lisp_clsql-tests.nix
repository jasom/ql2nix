
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql, 
   lisp_clsql, lisp_rt, lisp_uffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql lisp_rt lisp_uffi  ];
      inherit stdenv;
      systemName = "clsql-tests";
      
      sourceProject = "${lisp-project_clsql}";
      patches = [];
      lisp_dependencies = "${lisp_clsql} ${lisp_rt} ${lisp_uffi}";
      name = "lisp_clsql-tests-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
