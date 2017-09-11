
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-wish, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "trivial-wish";
      
      sourceProject = "${lisp-project_trivial-wish}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_trivial-wish-quicklisp-910afeea-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
