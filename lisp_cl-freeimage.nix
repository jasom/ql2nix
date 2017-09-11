
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-freeimage, 
  freeimage,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi freeimage ];
      inherit stdenv;
      systemName = "cl-freeimage";
      
      sourceProject = "${lisp-project_cl-freeimage}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-freeimage-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
