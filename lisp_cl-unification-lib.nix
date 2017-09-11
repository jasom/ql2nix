
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-unification, 
   lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-unification-lib";
      
      sourceProject = "${lisp-project_cl-unification}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_cl-unification-lib-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
