
{ buildLispPackage, stdenv, fetchurl, lisp-project_laap, 
   lisp_bordeaux-threads, lisp_cffi, lisp_cl-base32, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cffi lisp_cl-base32 lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "laap";
      
      sourceProject = "${lisp-project_laap}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_cl-base32} ${lisp_cl-ppcre}";
      name = "lisp_laap-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
