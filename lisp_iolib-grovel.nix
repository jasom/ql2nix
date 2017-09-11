
{ buildLispPackage, stdenv, fetchurl, lisp-project_iolib, 
   lisp_iolib-asdf, lisp_iolib-base, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iolib-asdf lisp_iolib-base lisp_cffi  ];
      inherit stdenv;
      systemName = "iolib.grovel";
      
      sourceProject = "${lisp-project_iolib}";
      patches = [];
      lisp_dependencies = "${lisp_iolib-asdf} ${lisp_iolib-base} ${lisp_cffi}";
      name = "lisp_iolib-grovel-v0.8.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
