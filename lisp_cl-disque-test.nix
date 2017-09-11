
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-disque, 
   lisp_cl-disque, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-disque lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-disque-test";
      
      sourceProject = "${lisp-project_cl-disque}";
      patches = [];
      lisp_dependencies = "${lisp_cl-disque} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-disque-test-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
