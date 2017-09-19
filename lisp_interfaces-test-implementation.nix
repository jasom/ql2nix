
{ buildLispPackage, stdenv, fetchurl, lisp-project_modularize-interfaces, 
   lisp_lambda-fiddle, lisp_trivial-arguments, lisp_modularize,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lambda-fiddle lisp_trivial-arguments lisp_modularize  ];
      inherit stdenv;
      systemName = "interfaces-test-implementation";
      
      sourceProject = "${lisp-project_modularize-interfaces}";
      patches = [];
      lisp_dependencies = "${lisp_lambda-fiddle} ${lisp_trivial-arguments} ${lisp_modularize}";
      name = "lisp_interfaces-test-implementation-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
