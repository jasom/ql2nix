
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-portaudio, 
  portaudio,   lisp_cffi, lisp_ffa,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_ffa portaudio ];
      inherit stdenv;
      systemName = "cl-portaudio";
      
      sourceProject = "${lisp-project_cl-portaudio}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_ffa}";
      name = "lisp_cl-portaudio-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
