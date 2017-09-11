
{ buildLispPackage, stdenv, fetchurl, lisp-project_lift, 
   lisp_lift,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift  ];
      inherit stdenv;
      systemName = "lift-test";
      
      sourceProject = "${lisp-project_lift}";
      patches = [];
      lisp_dependencies = "${lisp_lift}";
      name = "lisp_lift-test-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
