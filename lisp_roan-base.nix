
{ buildLispPackage, stdenv, fetchurl, lisp-project_roan, 
   lisp_alexandria, lisp_cl-ppcre, lisp_iterate, lisp_s-base64, lisp_trivial-garbage,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_iterate lisp_s-base64 lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "roan-base";
      
      sourceProject = "${lisp-project_roan}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_iterate} ${lisp_s-base64} ${lisp_trivial-garbage}";
      name = "lisp_roan-base-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
