
{ buildLispPackage, stdenv, fetchurl, lisp-project_iolib, 
  libfixposix,   lisp_swap-bytes, lisp_idna, lisp_bordeaux-threads, lisp_cffi, lisp_split-sequence, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swap-bytes lisp_idna lisp_bordeaux-threads lisp_cffi lisp_split-sequence lisp_alexandria libfixposix ];
      inherit stdenv;
      systemName = "iolib.examples";
      
      sourceProject = "${lisp-project_iolib}";
      patches = [];
      lisp_dependencies = "${lisp_swap-bytes} ${lisp_idna} ${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_iolib-examples-v0.8.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
