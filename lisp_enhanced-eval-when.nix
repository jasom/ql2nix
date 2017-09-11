
{ buildLispPackage, stdenv, fetchurl, lisp-project_enhanced-eval-when, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "enhanced-eval-when";
      
      sourceProject = "${lisp-project_enhanced-eval-when}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_enhanced-eval-when-1.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
