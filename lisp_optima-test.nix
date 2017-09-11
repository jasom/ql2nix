
{ buildLispPackage, stdenv, fetchurl, lisp-project_optima, 
   lisp_eos, lisp_optima, lisp_optima-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_eos lisp_optima lisp_optima-ppcre  ];
      inherit stdenv;
      systemName = "optima.test";
      
      sourceProject = "${lisp-project_optima}";
      patches = [];
      lisp_dependencies = "${lisp_eos} ${lisp_optima} ${lisp_optima-ppcre}";
      name = "lisp_optima-test-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
