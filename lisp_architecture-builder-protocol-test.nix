
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-builder-protocol, 
   lisp_alexandria, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_fiveam  ];
      inherit stdenv;
      systemName = "architecture.builder-protocol/test";
      
      sourceProject = "${lisp-project_architecture-builder-protocol}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_fiveam}";
      name = "lisp_architecture-builder-protocol-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
