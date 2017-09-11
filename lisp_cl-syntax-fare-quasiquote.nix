
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-syntax, 
   lisp_cl-syntax, lisp_fare-quasiquote,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax lisp_fare-quasiquote  ];
      inherit stdenv;
      systemName = "cl-syntax-fare-quasiquote";
      
      sourceProject = "${lisp-project_cl-syntax}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax} ${lisp_fare-quasiquote}";
      name = "lisp_cl-syntax-fare-quasiquote-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
