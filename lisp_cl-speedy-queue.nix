
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-speedy-queue, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-speedy-queue";
      
      sourceProject = "${lisp-project_cl-speedy-queue}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-speedy-queue-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
