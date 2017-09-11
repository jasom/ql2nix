
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-service-provider, 
   lisp_alexandria, lisp_let-plus, lisp_more-conditions, lisp_fiveam, lisp_architecture-service-provider,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_let-plus lisp_more-conditions lisp_fiveam lisp_architecture-service-provider  ];
      inherit stdenv;
      systemName = "architecture.service-provider/test";
      
      sourceProject = "${lisp-project_architecture-service-provider}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_let-plus} ${lisp_more-conditions} ${lisp_fiveam} ${lisp_architecture-service-provider}";
      name = "lisp_architecture-service-provider-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
