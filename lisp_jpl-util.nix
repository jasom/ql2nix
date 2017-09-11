
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-jpl-util, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "jpl-util";
      
      sourceProject = "${lisp-project_cl-jpl-util}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_jpl-util-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
