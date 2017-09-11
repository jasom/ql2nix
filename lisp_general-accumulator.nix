
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-general-accumulator, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "general-accumulator";
      
      sourceProject = "${lisp-project_cl-general-accumulator}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_general-accumulator-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
