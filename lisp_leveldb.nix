
{ buildLispPackage, stdenv, fetchurl, lisp-project_leveldb, 
  leveldb,   lisp_babel, lisp_cffi, lisp_cffi-grovel, lisp_trivial-garbage,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cffi lisp_cffi-grovel lisp_trivial-garbage leveldb ];
      inherit stdenv;
      systemName = "leveldb";
      
      sourceProject = "${lisp-project_leveldb}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cffi} ${lisp_cffi-grovel} ${lisp_trivial-garbage}";
      name = "lisp_leveldb-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
