
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cepl.build";
      
      sourceProject = "${lisp-project_cepl}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cepl-build-release-quicklisp-2a61dc0d-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
