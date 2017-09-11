
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ppcre, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-ppcre";
      
      sourceProject = "${lisp-project_cl-ppcre}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-ppcre-2.0.11";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
