
{ buildLispPackage, stdenv, fetchurl, lisp-project_workout-timer, 
   lisp_cffi-toolchain, lisp_mixalot, lisp_mixalot-vorbis, lisp_local-time, lisp_command-line-arguments,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-toolchain lisp_mixalot lisp_mixalot-vorbis lisp_local-time lisp_command-line-arguments  ];
      inherit stdenv;
      systemName = "workout-timer";
      
      sourceProject = "${lisp-project_workout-timer}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-toolchain} ${lisp_mixalot} ${lisp_mixalot-vorbis} ${lisp_local-time} ${lisp_command-line-arguments}";
      name = "lisp_workout-timer-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
