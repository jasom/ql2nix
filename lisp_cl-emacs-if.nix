
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-emacs-if, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-emacs-if";
      
      sourceProject = "${lisp-project_cl-emacs-if}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-emacs-if-20120305-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
