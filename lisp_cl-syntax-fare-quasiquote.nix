
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-syntax, 
   lisp_fare-quasiquote, lisp_named-readtables, lisp_trivial-types,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-quasiquote lisp_named-readtables lisp_trivial-types  ];
      inherit stdenv;
      systemName = "cl-syntax-fare-quasiquote";
      
      sourceProject = "${lisp-project_cl-syntax}";
      patches = [];
      lisp_dependencies = "${lisp_fare-quasiquote} ${lisp_named-readtables} ${lisp_trivial-types}";
      name = "lisp_cl-syntax-fare-quasiquote-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }