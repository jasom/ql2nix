
{ buildLispPackage, stdenv, fetchurl, lisp-project_modularize-interfaces, 
   lisp_modularize, lisp_modularize-interfaces,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_modularize lisp_modularize-interfaces  ];
      inherit stdenv;
      systemName = "interfaces-test-implementation";
      
      sourceProject = "${lisp-project_modularize-interfaces}";
      patches = [];
      lisp_dependencies = "${lisp_modularize} ${lisp_modularize-interfaces}";
      name = "lisp_interfaces-test-implementation-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
