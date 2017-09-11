
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-permutation, 
   lisp_cl-permutation,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-permutation  ];
      inherit stdenv;
      systemName = "cl-permutation-examples";
      
      sourceProject = "${lisp-project_cl-permutation}";
      patches = [];
      lisp_dependencies = "${lisp_cl-permutation}";
      name = "lisp_cl-permutation-examples-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
