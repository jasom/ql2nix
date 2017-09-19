
{ buildLispPackage, stdenv, fetchurl, lisp-project_leveldb, 
  leveldb,   lisp_trivial-garbage, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_cffi-grovel leveldb ];
      inherit stdenv;
      systemName = "leveldb";
      
      sourceProject = "${lisp-project_leveldb}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_cffi-grovel}";
      name = "lisp_leveldb-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
