
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-service-provider, 
   lisp_cl-hooks, lisp_architecture-service-provider,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-hooks lisp_architecture-service-provider  ];
      inherit stdenv;
      systemName = "architecture.service-provider-and-hooks";
      
      sourceProject = "${lisp-project_architecture-service-provider}";
      patches = [];
      lisp_dependencies = "${lisp_cl-hooks} ${lisp_architecture-service-provider}";
      name = "lisp_architecture-service-provider-and-hooks-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
