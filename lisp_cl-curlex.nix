
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-curlex, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-curlex";
      
      sourceProject = "${lisp-project_cl-curlex}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-curlex-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
