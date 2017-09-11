
{ buildLispPackage, stdenv, fetchurl, lisp-project_bytecurry-mocks, 
   lisp_bytecurry-mocks, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bytecurry-mocks lisp_fiveam  ];
      inherit stdenv;
      systemName = "bytecurry.mocks/test";
      
      sourceProject = "${lisp-project_bytecurry-mocks}";
      patches = [];
      lisp_dependencies = "${lisp_bytecurry-mocks} ${lisp_fiveam}";
      name = "lisp_bytecurry-mocks-test-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
