
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-strftime, 
   lisp_cffi, lisp_cl-strftime, lisp_fiveam,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-strftime lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-strftime/tests";
      
      sourceProject = "${lisp-project_cl-strftime}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-strftime} ${lisp_fiveam}";
      name = "lisp_cl-strftime-tests-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
