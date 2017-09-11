
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-drm, 
  libdrm,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi libdrm ];
      inherit stdenv;
      systemName = "cl-drm";
      
      sourceProject = "${lisp-project_cl-drm}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-drm-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
