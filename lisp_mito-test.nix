
{ buildLispPackage, stdenv, fetchurl, lisp-project_mito, 
   lisp_mito, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mito lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "mito-test";
      
      sourceProject = "${lisp-project_mito}";
      patches = [];
      lisp_dependencies = "${lisp_mito} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_mito-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
