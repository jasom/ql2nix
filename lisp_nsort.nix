
{ buildLispPackage, stdenv, fetchurl, lisp-project_nsort, 
   lisp_prove,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove  ];
      inherit stdenv;
      systemName = "nsort";
      
      sourceProject = "${lisp-project_nsort}";
      patches = [];
      lisp_dependencies = "${lisp_prove}";
      name = "lisp_nsort-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
