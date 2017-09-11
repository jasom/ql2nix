
{ buildLispPackage, stdenv, fetchurl, lisp-project_policy-cond, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "policy-cond";
      
      sourceProject = "${lisp-project_policy-cond}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_policy-cond-20151218-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
