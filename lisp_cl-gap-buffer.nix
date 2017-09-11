
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gap-buffer, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-gap-buffer";
      
      sourceProject = "${lisp-project_cl-gap-buffer}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-gap-buffer-20120305-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
