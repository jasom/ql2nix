
{ buildLispPackage, stdenv, fetchurl, lisp-project_pettomato-indexed-priority-queue, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "pettomato-indexed-priority-queue";
      
      sourceProject = "${lisp-project_pettomato-indexed-priority-queue}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_pettomato-indexed-priority-queue-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
