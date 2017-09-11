
{ buildLispPackage, stdenv, fetchurl, lisp-project_assoc-utils, 
   lisp_assoc-utils, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_assoc-utils lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "assoc-utils-test";
      
      sourceProject = "${lisp-project_assoc-utils}";
      patches = [];
      lisp_dependencies = "${lisp_assoc-utils} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_assoc-utils-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
