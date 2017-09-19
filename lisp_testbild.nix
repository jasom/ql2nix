
{ buildLispPackage, stdenv, fetchurl, lisp-project_testbild, 
   lisp_graylex,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_graylex  ];
      inherit stdenv;
      systemName = "testbild";
      
      sourceProject = "${lisp-project_testbild}";
      patches = [];
      lisp_dependencies = "${lisp_graylex}";
      name = "lisp_testbild-20101207-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
