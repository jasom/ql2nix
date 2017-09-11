
{ buildLispPackage, stdenv, fetchurl, lisp-project_fiveam, 
   lisp_fiveam,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam  ];
      inherit stdenv;
      systemName = "fiveam/test";
      
      sourceProject = "${lisp-project_fiveam}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam}";
      name = "lisp_fiveam-test-v1.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
