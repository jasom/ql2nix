
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-service-provider, 
   lisp_alexandria, lisp_let-plus, lisp_more-conditions, lisp_utilities-print-items,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_let-plus lisp_more-conditions lisp_utilities-print-items  ];
      inherit stdenv;
      systemName = "architecture.service-provider";
      
      sourceProject = "${lisp-project_architecture-service-provider}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_let-plus} ${lisp_more-conditions} ${lisp_utilities-print-items}";
      name = "lisp_architecture-service-provider-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
