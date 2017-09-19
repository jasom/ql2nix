
{ buildLispPackage, stdenv, fetchurl, lisp-project_roan, 
   lisp_s-base64, lisp_cl-ppcre, lisp_trivial-garbage, lisp_iterate, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_s-base64 lisp_cl-ppcre lisp_trivial-garbage lisp_iterate lisp_alexandria  ];
      inherit stdenv;
      systemName = "roan-base";
      
      sourceProject = "${lisp-project_roan}";
      patches = [];
      lisp_dependencies = "${lisp_s-base64} ${lisp_cl-ppcre} ${lisp_trivial-garbage} ${lisp_iterate} ${lisp_alexandria}";
      name = "lisp_roan-base-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
