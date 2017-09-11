
{ buildLispPackage, stdenv, fetchurl, lisp-project_psychiq, 
   lisp_prove, lisp_prove-asdf, lisp_psychiq,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove lisp_prove-asdf lisp_psychiq  ];
      inherit stdenv;
      systemName = "psychiq-test";
      
      sourceProject = "${lisp-project_psychiq}";
      patches = [];
      lisp_dependencies = "${lisp_prove} ${lisp_prove-asdf} ${lisp_psychiq}";
      name = "lisp_psychiq-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
