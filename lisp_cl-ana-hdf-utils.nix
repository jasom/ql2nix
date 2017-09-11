
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_alexandria, lisp_cffi, lisp_cl-ana-hdf-cffi, lisp_cl-ana-hdf-typespec, lisp_cl-ana-macro-utils, lisp_cl-ana-memoization, lisp_cl-ana-pathname-utils, lisp_cl-ana-string-utils, lisp_cl-ana-typespec,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cl-ana-hdf-cffi lisp_cl-ana-hdf-typespec lisp_cl-ana-macro-utils lisp_cl-ana-memoization lisp_cl-ana-pathname-utils lisp_cl-ana-string-utils lisp_cl-ana-typespec  ];
      inherit stdenv;
      systemName = "cl-ana.hdf-utils";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cl-ana-hdf-cffi} ${lisp_cl-ana-hdf-typespec} ${lisp_cl-ana-macro-utils} ${lisp_cl-ana-memoization} ${lisp_cl-ana-pathname-utils} ${lisp_cl-ana-string-utils} ${lisp_cl-ana-typespec}";
      name = "lisp_cl-ana-hdf-utils-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
