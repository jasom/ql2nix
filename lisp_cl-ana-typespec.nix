
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_alexandria, lisp_cffi, lisp_cl-ana-int-char, lisp_cl-ana-list-utils, lisp_cl-ana-memoization, lisp_cl-ana-string-utils, lisp_cl-ana-symbol-utils, lisp_cl-ana-tensor,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cl-ana-int-char lisp_cl-ana-list-utils lisp_cl-ana-memoization lisp_cl-ana-string-utils lisp_cl-ana-symbol-utils lisp_cl-ana-tensor  ];
      inherit stdenv;
      systemName = "cl-ana.typespec";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cl-ana-int-char} ${lisp_cl-ana-list-utils} ${lisp_cl-ana-memoization} ${lisp_cl-ana-string-utils} ${lisp_cl-ana-symbol-utils} ${lisp_cl-ana-tensor}";
      name = "lisp_cl-ana-typespec-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }