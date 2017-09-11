
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-utf-8, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "trivial-utf-8";
      
      sourceProject = "${lisp-project_trivial-utf-8}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_trivial-utf-8-20111001-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
