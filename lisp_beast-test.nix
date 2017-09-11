
{ buildLispPackage, stdenv, fetchurl, lisp-project_beast, 
   lisp_1am,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_1am  ];
      inherit stdenv;
      systemName = "beast-test";
      
      sourceProject = "${lisp-project_beast}";
      patches = [];
      lisp_dependencies = "${lisp_1am}";
      name = "lisp_beast-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }