
{ buildLispPackage, stdenv, fetchurl, lisp-project_exponential-backoff, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "exponential-backoff";
      
      sourceProject = "${lisp-project_exponential-backoff}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_exponential-backoff-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
