
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_alexandria, lisp_cl-ana-generic-math, lisp_cl-ana-list-utils, lisp_cl-ana-macro-utils, lisp_cl-ana-symbol-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ana-generic-math lisp_cl-ana-list-utils lisp_cl-ana-macro-utils lisp_cl-ana-symbol-utils  ];
      inherit stdenv;
      systemName = "cl-ana.tensor";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ana-generic-math} ${lisp_cl-ana-list-utils} ${lisp_cl-ana-macro-utils} ${lisp_cl-ana-symbol-utils}";
      name = "lisp_cl-ana-tensor-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
