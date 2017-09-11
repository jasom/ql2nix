
{ buildLispPackage, stdenv, fetchurl, lisp-project_antik, 
   lisp_alexandria, lisp_cl-ppcre, lisp_iterate, lisp_lisp-unit, lisp_metabang-bind, lisp_named-readtables, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_iterate lisp_lisp-unit lisp_metabang-bind lisp_named-readtables lisp_split-sequence  ];
      inherit stdenv;
      systemName = "antik-base";
      
      sourceProject = "${lisp-project_antik}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_iterate} ${lisp_lisp-unit} ${lisp_metabang-bind} ${lisp_named-readtables} ${lisp_split-sequence}";
      name = "lisp_antik-base-master-ad6432e3-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
