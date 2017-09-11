
{ buildLispPackage, stdenv, fetchurl, lisp-project_iolib, 
   lisp_iolib-asdf, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iolib-asdf lisp_split-sequence  ];
      inherit stdenv;
      systemName = "iolib.base";
      
      sourceProject = "${lisp-project_iolib}";
      patches = [];
      lisp_dependencies = "${lisp_iolib-asdf} ${lisp_split-sequence}";
      name = "lisp_iolib-base-v0.8.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
