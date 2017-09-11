
{ buildLispPackage, stdenv, fetchurl, lisp-project_iolib, 
   lisp_iolib-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iolib-asdf  ];
      inherit stdenv;
      systemName = "iolib.common-lisp";
      
      sourceProject = "${lisp-project_iolib}";
      patches = [];
      lisp_dependencies = "${lisp_iolib-asdf}";
      name = "lisp_iolib-common-lisp-v0.8.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
