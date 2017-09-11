
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bson, 
   lisp_cl-bson, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-bson lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-bson-test";
      
      sourceProject = "${lisp-project_cl-bson}";
      patches = [];
      lisp_dependencies = "${lisp_cl-bson} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-bson-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
