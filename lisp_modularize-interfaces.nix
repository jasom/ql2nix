
{ buildLispPackage, stdenv, fetchurl, lisp-project_modularize-interfaces, 
   lisp_modularize, lisp_trivial-arguments, lisp_lambda-fiddle,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_modularize lisp_trivial-arguments lisp_lambda-fiddle  ];
      inherit stdenv;
      systemName = "modularize-interfaces";
      
      sourceProject = "${lisp-project_modularize-interfaces}";
      patches = [];
      lisp_dependencies = "${lisp_modularize} ${lisp_trivial-arguments} ${lisp_lambda-fiddle}";
      name = "lisp_modularize-interfaces-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
