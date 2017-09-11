
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-service-provider, 
   lisp_alexandria, lisp_fiveam, lisp_architecture-service-provider-and-hooks,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_fiveam lisp_architecture-service-provider-and-hooks  ];
      inherit stdenv;
      systemName = "architecture.service-provider-and-hooks/test";
      
      sourceProject = "${lisp-project_architecture-service-provider}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_fiveam} ${lisp_architecture-service-provider-and-hooks}";
      name = "lisp_architecture-service-provider-and-hooks-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
