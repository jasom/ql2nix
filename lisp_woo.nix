
{ buildLispPackage, stdenv, fetchurl, lisp-project_woo, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_cffi, lisp_cffi-grovel, lisp_clack-socket, lisp_fast-http, lisp_fast-io, lisp_lev, lisp_quri, lisp_smart-buffer, lisp_static-vectors, lisp_swap-bytes, lisp_trivial-utf-8, lisp_vom, lisp_cl-speedy-queue,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cffi lisp_cffi-grovel lisp_clack-socket lisp_fast-http lisp_fast-io lisp_lev lisp_quri lisp_smart-buffer lisp_static-vectors lisp_swap-bytes lisp_trivial-utf-8 lisp_vom lisp_cl-speedy-queue  ];
      inherit stdenv;
      systemName = "woo";
      
      sourceProject = "${lisp-project_woo}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_cffi-grovel} ${lisp_clack-socket} ${lisp_fast-http} ${lisp_fast-io} ${lisp_lev} ${lisp_quri} ${lisp_smart-buffer} ${lisp_static-vectors} ${lisp_swap-bytes} ${lisp_trivial-utf-8} ${lisp_vom} ${lisp_cl-speedy-queue}";
      name = "lisp_woo-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
