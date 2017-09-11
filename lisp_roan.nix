
{ buildLispPackage, stdenv, fetchurl, lisp-project_roan, 
   lisp_alexandria, lisp_cl-fad, lisp_cl-ppcre, lisp_drakma, lisp_roan-base, lisp_sqlite, lisp_zip,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-fad lisp_cl-ppcre lisp_drakma lisp_roan-base lisp_sqlite lisp_zip  ];
      inherit stdenv;
      systemName = "roan";
      
      sourceProject = "${lisp-project_roan}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_drakma} ${lisp_roan-base} ${lisp_sqlite} ${lisp_zip}";
      name = "lisp_roan-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }