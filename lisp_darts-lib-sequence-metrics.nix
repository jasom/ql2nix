
{ buildLispPackage, stdenv, fetchurl, lisp-project_dartsclsequencemetrics, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "darts.lib.sequence-metrics";
      
      sourceProject = "${lisp-project_dartsclsequencemetrics}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_darts-lib-sequence-metrics-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
