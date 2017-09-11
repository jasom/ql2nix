
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-algebraic-data-type, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-algebraic-data-type";
      
      sourceProject = "${lisp-project_cl-algebraic-data-type}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-algebraic-data-type-20141106-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
