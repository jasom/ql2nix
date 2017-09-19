
{ buildLispPackage, stdenv, fetchurl, lisp-project_mixalot, 
  flac,   lisp_cffi-grovel, lisp_bordeaux-threads, lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-grovel lisp_bordeaux-threads lisp_cffi flac ];
      inherit stdenv;
      systemName = "mixalot-flac";
      
      sourceProject = "${lisp-project_mixalot}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-grovel} ${lisp_bordeaux-threads} ${lisp_cffi}";
      name = "lisp_mixalot-flac-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
