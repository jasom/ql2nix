
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rabbit, 
  rabbitmq-c,   lisp_alexandria, lisp_babel, lisp_cffi, lisp_cffi-grovel, lisp_cffi-libffi, lisp_cl-ppcre,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel lisp_cffi lisp_cffi-grovel lisp_cffi-libffi lisp_cl-ppcre rabbitmq-c ];
      inherit stdenv;
      systemName = "cl-rabbit";
      
      sourceProject = "${lisp-project_cl-rabbit}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel} ${lisp_cffi} ${lisp_cffi-grovel} ${lisp_cffi-libffi} ${lisp_cl-ppcre}";
      name = "lisp_cl-rabbit-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
