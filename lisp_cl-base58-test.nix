
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-base58, 
   lisp_cl-base58, lisp_cl-test-more,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base58 lisp_cl-test-more  ];
      inherit stdenv;
      systemName = "cl-base58-test";
      
      sourceProject = "${lisp-project_cl-base58}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base58} ${lisp_cl-test-more}";
      name = "lisp_cl-base58-test-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
