
{ buildLispPackage, stdenv, fetchurl, lisp-project_eazy-process, 
   lisp_cl-rlimit, lisp_trivial-garbage, lisp_iolib-syscalls, lisp_optima-ppcre, lisp_optima, lisp_cffi, lisp_alexandria, lisp_iterate,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-rlimit lisp_trivial-garbage lisp_iolib-syscalls lisp_optima-ppcre lisp_optima lisp_cffi lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "eazy-process";
      
      sourceProject = "${lisp-project_eazy-process}";
      patches = [];
      lisp_dependencies = "${lisp_cl-rlimit} ${lisp_trivial-garbage} ${lisp_iolib-syscalls} ${lisp_optima-ppcre} ${lisp_optima} ${lisp_cffi} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_eazy-process-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
