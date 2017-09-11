
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_alexandria, lisp_cl-ana-binary-tree, lisp_cl-ana-hdf-cffi, lisp_cl-ana-hdf-typespec, lisp_cl-ana-hdf-utils, lisp_cl-ana-list-utils, lisp_cl-ana-memoization, lisp_cl-ana-table, lisp_cl-ana-typed-table, lisp_cl-ana-typespec,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ana-binary-tree lisp_cl-ana-hdf-cffi lisp_cl-ana-hdf-typespec lisp_cl-ana-hdf-utils lisp_cl-ana-list-utils lisp_cl-ana-memoization lisp_cl-ana-table lisp_cl-ana-typed-table lisp_cl-ana-typespec  ];
      inherit stdenv;
      systemName = "cl-ana.hdf-table";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ana-binary-tree} ${lisp_cl-ana-hdf-cffi} ${lisp_cl-ana-hdf-typespec} ${lisp_cl-ana-hdf-utils} ${lisp_cl-ana-list-utils} ${lisp_cl-ana-memoization} ${lisp_cl-ana-table} ${lisp_cl-ana-typed-table} ${lisp_cl-ana-typespec}";
      name = "lisp_cl-ana-hdf-table-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
