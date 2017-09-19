
{ buildLispPackage, stdenv, fetchurl, lisp-project_random, 
   lisp_com-google-base,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-google-base  ];
      inherit stdenv;
      systemName = "acm-random";
      
      sourceProject = "${lisp-project_random}";
      patches = [];
      lisp_dependencies = "${lisp_com-google-base}";
      name = "lisp_acm-random-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
