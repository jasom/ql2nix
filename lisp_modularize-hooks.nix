
{ buildLispPackage, stdenv, fetchurl, lisp-project_modularize-hooks, 
   lisp_modularize, lisp_closer-mop, lisp_trivial-arguments, lisp_lambda-fiddle,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_modularize lisp_closer-mop lisp_trivial-arguments lisp_lambda-fiddle  ];
      inherit stdenv;
      systemName = "modularize-hooks";
      
      sourceProject = "${lisp-project_modularize-hooks}";
      patches = [];
      lisp_dependencies = "${lisp_modularize} ${lisp_closer-mop} ${lisp_trivial-arguments} ${lisp_lambda-fiddle}";
      name = "lisp_modularize-hooks-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
