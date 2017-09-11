
{ buildLispPackage, stdenv, fetchurl, lisp-project_roan, 
   lisp_alexandria, lisp_cl-fad, lisp_cl-ppcre, lisp_iterate, lisp_roan, lisp_trivial-documentation,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-fad lisp_cl-ppcre lisp_iterate lisp_roan lisp_trivial-documentation  ];
      inherit stdenv;
      systemName = "roan/doc";
      
      sourceProject = "${lisp-project_roan}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_iterate} ${lisp_roan} ${lisp_trivial-documentation}";
      name = "lisp_roan-doc-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
