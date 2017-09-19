
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-async, 
  openssl,   lisp_cl-ppcre, lisp_vom, lisp_fast-io, lisp_bordeaux-threads, lisp_cl-libuv, lisp_static-vectors, lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_vom lisp_fast-io lisp_bordeaux-threads lisp_cl-libuv lisp_static-vectors lisp_cffi openssl ];
      inherit stdenv;
      systemName = "cl-async-ssl";
      
      sourceProject = "${lisp-project_cl-async}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_vom} ${lisp_fast-io} ${lisp_bordeaux-threads} ${lisp_cl-libuv} ${lisp_static-vectors} ${lisp_cffi}";
      name = "lisp_cl-async-ssl-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
