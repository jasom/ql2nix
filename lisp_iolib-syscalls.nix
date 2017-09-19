
{ buildLispPackage, stdenv, fetchurl, lisp-project_iolib, 
  libfixposix,   lisp_cffi, lisp_split-sequence, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_split-sequence lisp_alexandria libfixposix ];
      inherit stdenv;
      systemName = "iolib/syscalls";
      
      sourceProject = "${lisp-project_iolib}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_iolib-syscalls-v0.8.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
