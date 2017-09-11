
{ buildLispPackage, stdenv, fetchurl, lisp-project_checkl, 
   lisp_checkl, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_checkl lisp_fiveam  ];
      inherit stdenv;
      systemName = "checkl-test";
      
      sourceProject = "${lisp-project_checkl}";
      patches = [];
      lisp_dependencies = "${lisp_checkl} ${lisp_fiveam}";
      name = "lisp_checkl-test-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
