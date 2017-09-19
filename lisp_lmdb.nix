
{ buildLispPackage, stdenv, fetchurl, lisp-project_lmdb, 
  lmdb,   lisp_trivial-utf-8, lisp_liblmdb,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8 lisp_liblmdb lmdb ];
      inherit stdenv;
      systemName = "lmdb";
      
      sourceProject = "${lisp-project_lmdb}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8} ${lisp_liblmdb}";
      name = "lisp_lmdb-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
