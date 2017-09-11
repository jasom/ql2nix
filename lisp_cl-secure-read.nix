
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-secure-read, 
   lisp_alexandria, lisp_defmacro-enhance, lisp_iterate, lisp_named-readtables, lisp_rutils, lisp_yaclanapht,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_defmacro-enhance lisp_iterate lisp_named-readtables lisp_rutils lisp_yaclanapht  ];
      inherit stdenv;
      systemName = "cl-secure-read";
      
      sourceProject = "${lisp-project_cl-secure-read}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_defmacro-enhance} ${lisp_iterate} ${lisp_named-readtables} ${lisp_rutils} ${lisp_yaclanapht}";
      name = "lisp_cl-secure-read-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
