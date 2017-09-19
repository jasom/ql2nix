
{ buildLispPackage, stdenv, fetchurl, lisp-project_modularize-hooks, 
   lisp_lambda-fiddle, lisp_trivial-arguments, lisp_closer-mop, lisp_modularize,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lambda-fiddle lisp_trivial-arguments lisp_closer-mop lisp_modularize  ];
      inherit stdenv;
      systemName = "modularize-hooks";
      
      sourceProject = "${lisp-project_modularize-hooks}";
      patches = [];
      lisp_dependencies = "${lisp_lambda-fiddle} ${lisp_trivial-arguments} ${lisp_closer-mop} ${lisp_modularize}";
      name = "lisp_modularize-hooks-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
