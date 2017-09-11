
{ buildLispPackage, stdenv, fetchurl, lisp-project_mixalot, 
  flac,   lisp_cffi, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cffi-grovel flac ];
      inherit stdenv;
      systemName = "flac";
      
      sourceProject = "${lisp-project_mixalot}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cffi-grovel}";
      name = "lisp_flac-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
