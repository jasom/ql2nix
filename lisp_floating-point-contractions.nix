
{ buildLispPackage, stdenv, fetchurl, lisp-project_floating-point-contractions, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "floating-point-contractions";
      
      sourceProject = "${lisp-project_floating-point-contractions}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_floating-point-contractions-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
