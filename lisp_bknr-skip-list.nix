
{ buildLispPackage, stdenv, fetchurl, lisp-project_bknr-datastore, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "bknr.skip-list";
      
      sourceProject = "${lisp-project_bknr-datastore}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_bknr-skip-list-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
