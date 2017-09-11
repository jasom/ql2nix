
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-dbi, 
   lisp_cl-syntax, lisp_cl-syntax-annot, lisp_dbi, lisp_sqlite,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax lisp_cl-syntax-annot lisp_dbi lisp_sqlite  ];
      inherit stdenv;
      systemName = "dbd-sqlite3";
      
      sourceProject = "${lisp-project_cl-dbi}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax} ${lisp_cl-syntax-annot} ${lisp_dbi} ${lisp_sqlite}";
      name = "lisp_dbd-sqlite3-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
