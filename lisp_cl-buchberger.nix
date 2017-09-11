
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-buchberger, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-buchberger";
      
      sourceProject = "${lisp-project_cl-buchberger}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-buchberger-20110522-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
