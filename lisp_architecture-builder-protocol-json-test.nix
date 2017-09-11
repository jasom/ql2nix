
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-builder-protocol, 
   lisp_alexandria, lisp_fiveam, lisp_architecture-builder-protocol-json,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_fiveam lisp_architecture-builder-protocol-json  ];
      inherit stdenv;
      systemName = "architecture.builder-protocol.json/test";
      
      sourceProject = "${lisp-project_architecture-builder-protocol}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_fiveam} ${lisp_architecture-builder-protocol-json}";
      name = "lisp_architecture-builder-protocol-json-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
