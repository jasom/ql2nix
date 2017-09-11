
{ buildLispPackage, stdenv, fetchurl, lisp-project_zcdb, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "zcdb";
      
      sourceProject = "${lisp-project_zcdb}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_zcdb-1.0.4";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
