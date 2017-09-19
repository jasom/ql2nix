
{ buildLispPackage, stdenv, fetchurl, lisp-project_woo, 
   lisp_cl-speedy-queue, lisp_vom, lisp_trivial-utf-8, lisp_fast-io, lisp_quri, lisp_fast-http, lisp_bordeaux-threads, lisp_static-vectors, lisp_swap-bytes, lisp_clack-socket, lisp_lev, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-speedy-queue lisp_vom lisp_trivial-utf-8 lisp_fast-io lisp_quri lisp_fast-http lisp_bordeaux-threads lisp_static-vectors lisp_swap-bytes lisp_clack-socket lisp_lev lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "clack-handler-woo";
      
      sourceProject = "${lisp-project_woo}";
      patches = [];
      lisp_dependencies = "${lisp_cl-speedy-queue} ${lisp_vom} ${lisp_trivial-utf-8} ${lisp_fast-io} ${lisp_quri} ${lisp_fast-http} ${lisp_bordeaux-threads} ${lisp_static-vectors} ${lisp_swap-bytes} ${lisp_clack-socket} ${lisp_lev} ${lisp_cffi-grovel}";
      name = "lisp_clack-handler-woo-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
