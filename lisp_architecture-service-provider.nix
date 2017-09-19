
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-service-provider, 
   lisp_utilities-print-items, lisp_more-conditions, lisp_let-plus, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_utilities-print-items lisp_more-conditions lisp_let-plus lisp_alexandria  ];
      inherit stdenv;
      systemName = "architecture.service-provider";
      
      sourceProject = "${lisp-project_architecture-service-provider}";
      patches = [];
      lisp_dependencies = "${lisp_utilities-print-items} ${lisp_more-conditions} ${lisp_let-plus} ${lisp_alexandria}";
      name = "lisp_architecture-service-provider-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
