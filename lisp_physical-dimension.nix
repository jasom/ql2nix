
{ buildLispPackage, stdenv, fetchurl, lisp-project_antik, 
   lisp_trivial-utf-8, lisp_fare-utils, lisp_trivial-garbage, lisp_cffi, lisp_lisp-unit, lisp_split-sequence, lisp_cl-ppcre, lisp_named-readtables, lisp_metabang-bind, lisp_alexandria, lisp_iterate,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8 lisp_fare-utils lisp_trivial-garbage lisp_cffi lisp_lisp-unit lisp_split-sequence lisp_cl-ppcre lisp_named-readtables lisp_metabang-bind lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "physical-dimension";
      
      sourceProject = "${lisp-project_antik}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8} ${lisp_fare-utils} ${lisp_trivial-garbage} ${lisp_cffi} ${lisp_lisp-unit} ${lisp_split-sequence} ${lisp_cl-ppcre} ${lisp_named-readtables} ${lisp_metabang-bind} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_physical-dimension-master-ad6432e3-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
