
{ buildLispPackage, stdenv, fetchurl, lisp-project_command-line-arguments, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "command-line-arguments";
      
      sourceProject = "${lisp-project_command-line-arguments}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_command-line-arguments-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
