
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sqlite, 
  sqlite,   lisp_cffi, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_iterate sqlite ];
      inherit stdenv;
      systemName = "sqlite";
      
      sourceProject = "${lisp-project_cl-sqlite}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_iterate}";
      name = "lisp_sqlite-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
