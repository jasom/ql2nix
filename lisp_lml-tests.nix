
{ buildLispPackage, stdenv, fetchurl, lisp-project_lml, 
   lisp_lml, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lml lisp_rt  ];
      inherit stdenv;
      systemName = "lml-tests";
      
      sourceProject = "${lisp-project_lml}";
      patches = [];
      lisp_dependencies = "${lisp_lml} ${lisp_rt}";
      name = "lisp_lml-tests-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
