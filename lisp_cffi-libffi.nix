
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi, 
  libffi,   lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi libffi ];
      inherit stdenv;
      systemName = "cffi-libffi";
      
      sourceProject = "${lisp-project_cffi}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cffi-libffi_0.19.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
