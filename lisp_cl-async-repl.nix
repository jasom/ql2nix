
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-async, 
   lisp_cl-ppcre, lisp_vom, lisp_fast-io, lisp_bordeaux-threads, lisp_cl-libuv, lisp_static-vectors, lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_vom lisp_fast-io lisp_bordeaux-threads lisp_cl-libuv lisp_static-vectors lisp_cffi  ];
      inherit stdenv;
      systemName = "cl-async-repl";
      
      sourceProject = "${lisp-project_cl-async}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_vom} ${lisp_fast-io} ${lisp_bordeaux-threads} ${lisp_cl-libuv} ${lisp_static-vectors} ${lisp_cffi}";
      name = "lisp_cl-async-repl-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
