
{ buildLispPackage, stdenv, fetchurl, lisp-project_mk-string-metrics, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "mk-string-metrics";
      
      sourceProject = "${lisp-project_mk-string-metrics}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_mk-string-metrics-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
