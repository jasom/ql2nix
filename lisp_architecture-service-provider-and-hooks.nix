
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-service-provider, 
   lisp_utilities-print-items, lisp_more-conditions, lisp_cl-hooks,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_utilities-print-items lisp_more-conditions lisp_cl-hooks  ];
      inherit stdenv;
      systemName = "architecture.service-provider-and-hooks";
      
      sourceProject = "${lisp-project_architecture-service-provider}";
      patches = [];
      lisp_dependencies = "${lisp_utilities-print-items} ${lisp_more-conditions} ${lisp_cl-hooks}";
      name = "lisp_architecture-service-provider-and-hooks-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
