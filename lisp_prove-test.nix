
{ buildLispPackage, stdenv, fetchurl, lisp-project_prove, 
   lisp_alexandria, lisp_prove, lisp_prove-asdf, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_prove lisp_prove-asdf lisp_split-sequence  ];
      inherit stdenv;
      systemName = "prove-test";
      
      sourceProject = "${lisp-project_prove}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_prove} ${lisp_prove-asdf} ${lisp_split-sequence}";
      name = "lisp_prove-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
