
{ buildLispPackage, stdenv, fetchurl, lisp-project_fare-quasiquote, 
   lisp_fare-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-utils  ];
      inherit stdenv;
      systemName = "fare-quasiquote";
      
      sourceProject = "${lisp-project_fare-quasiquote}";
      patches = [];
      lisp_dependencies = "${lisp_fare-utils}";
      name = "lisp_fare-quasiquote-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
