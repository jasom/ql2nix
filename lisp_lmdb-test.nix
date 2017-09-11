
{ buildLispPackage, stdenv, fetchurl, lisp-project_lmdb, 
   lisp_fiveam, lisp_lmdb,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_lmdb  ];
      inherit stdenv;
      systemName = "lmdb-test";
      
      sourceProject = "${lisp-project_lmdb}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_lmdb}";
      name = "lisp_lmdb-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
