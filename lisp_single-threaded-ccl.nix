
{ buildLispPackage, stdenv, fetchurl, lisp-project_single-threaded-ccl, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "single-threaded-ccl";
      
      sourceProject = "${lisp-project_single-threaded-ccl}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_single-threaded-ccl-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
