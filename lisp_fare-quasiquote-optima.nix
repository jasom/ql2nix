
{ buildLispPackage, stdenv, fetchurl, lisp-project_fare-quasiquote, 
   lisp_optima, lisp_fare-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_optima lisp_fare-utils  ];
      inherit stdenv;
      systemName = "fare-quasiquote-optima";
      
      sourceProject = "${lisp-project_fare-quasiquote}";
      patches = [];
      lisp_dependencies = "${lisp_optima} ${lisp_fare-utils}";
      name = "lisp_fare-quasiquote-optima-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
