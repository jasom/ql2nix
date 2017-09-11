
{ buildLispPackage, stdenv, fetchurl, lisp-project_enhanced-multiple-value-bind, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "enhanced-multiple-value-bind";
      
      sourceProject = "${lisp-project_enhanced-multiple-value-bind}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_enhanced-multiple-value-bind-1.0.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
