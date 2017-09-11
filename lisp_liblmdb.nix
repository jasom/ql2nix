
{ buildLispPackage, stdenv, fetchurl, lisp-project_liblmdb, 
   lisp_cffi,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi  ];
      inherit stdenv;
      systemName = "liblmdb";
      
      sourceProject = "${lisp-project_liblmdb}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_liblmdb-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
