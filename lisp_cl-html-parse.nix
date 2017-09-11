
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-html-parse, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-html-parse";
      
      sourceProject = "${lisp-project_cl-html-parse}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-html-parse-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
