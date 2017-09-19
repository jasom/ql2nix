
{ buildLispPackage, stdenv, fetchurl, lisp-project_workout-timer, 
  libvorbis,   lisp_command-line-arguments, lisp_local-time, lisp_mixalot-vorbis, lisp_mixalot, lisp_cffi-toolchain,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_command-line-arguments lisp_local-time lisp_mixalot-vorbis lisp_mixalot lisp_cffi-toolchain libvorbis ];
      inherit stdenv;
      systemName = "workout-timer";
      
      sourceProject = "${lisp-project_workout-timer}";
      patches = [];
      lisp_dependencies = "${lisp_command-line-arguments} ${lisp_local-time} ${lisp_mixalot-vorbis} ${lisp_mixalot} ${lisp_cffi-toolchain}";
      name = "lisp_workout-timer-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
