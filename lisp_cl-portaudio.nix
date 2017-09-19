
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-portaudio, 
  portaudio,   lisp_ffa, lisp_cffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ffa lisp_cffi portaudio ];
      inherit stdenv;
      systemName = "cl-portaudio";
      
      sourceProject = "${lisp-project_cl-portaudio}";
      patches = [];
      lisp_dependencies = "${lisp_ffa} ${lisp_cffi}";
      name = "lisp_cl-portaudio-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
