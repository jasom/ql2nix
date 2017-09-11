
{ buildLispPackage, stdenv, fetchurl, lisp-project_metabang-bind, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "metabang-bind";
      
      sourceProject = "${lisp-project_metabang-bind}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_metabang-bind-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
