
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-dump-core, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "trivial-dump-core";
      
      sourceProject = "${lisp-project_trivial-dump-core}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_trivial-dump-core-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
