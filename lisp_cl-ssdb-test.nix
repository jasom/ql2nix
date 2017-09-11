
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ssdb, 
   lisp_cl-ssdb, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssdb lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-ssdb-test";
      
      sourceProject = "${lisp-project_cl-ssdb}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssdb} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-ssdb-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
