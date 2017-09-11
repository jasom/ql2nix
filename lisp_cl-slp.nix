
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-slp, 
  openslp,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi openslp ];
      inherit stdenv;
      systemName = "cl-slp";
      
      sourceProject = "${lisp-project_cl-slp}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-slp-20140826-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
