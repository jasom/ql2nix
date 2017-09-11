
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
  mesa,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi mesa ];
      inherit stdenv;
      systemName = "lispbuilder-opengl-1-1";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_lispbuilder-opengl-1-1-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
