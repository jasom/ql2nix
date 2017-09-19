
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mssql, 
  freetds,   lisp_parse-number, lisp_garbage-pools, lisp_iterate, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-number lisp_garbage-pools lisp_iterate lisp_cffi freetds ];
      inherit stdenv;
      systemName = "mssql";
      
      sourceProject = "${lisp-project_cl-mssql}";
      patches = [];
      lisp_dependencies = "${lisp_parse-number} ${lisp_garbage-pools} ${lisp_iterate} ${lisp_cffi}";
      name = "lisp_mssql-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
