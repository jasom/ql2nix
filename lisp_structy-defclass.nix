
{ buildLispPackage, stdenv, fetchurl, lisp-project_structy-defclass, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "structy-defclass";
      
      sourceProject = "${lisp-project_structy-defclass}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_structy-defclass-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
