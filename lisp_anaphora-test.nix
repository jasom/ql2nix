
{ buildLispPackage, stdenv, fetchurl, lisp-project_anaphora, 
   lisp_rt,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rt  ];
      inherit stdenv;
      systemName = "anaphora/test";
      
      sourceProject = "${lisp-project_anaphora}";
      patches = [];
      lisp_dependencies = "${lisp_rt}";
      name = "lisp_anaphora-test-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
