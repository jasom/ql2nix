
{ buildLispPackage, stdenv, fetchurl, lisp-project_random, 
   lisp_com-google-base, lisp_random,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-google-base lisp_random  ];
      inherit stdenv;
      systemName = "acm-random";
      
      sourceProject = "${lisp-project_random}";
      patches = [];
      lisp_dependencies = "${lisp_com-google-base} ${lisp_random}";
      name = "lisp_acm-random-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
