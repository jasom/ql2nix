
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mssql, 
  freetds,   lisp_cffi, lisp_iterate, lisp_garbage-pools, lisp_parse-number,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_iterate lisp_garbage-pools lisp_parse-number freetds ];
      inherit stdenv;
      systemName = "mssql";
      
      sourceProject = "${lisp-project_cl-mssql}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_iterate} ${lisp_garbage-pools} ${lisp_parse-number}";
      name = "lisp_mssql-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
