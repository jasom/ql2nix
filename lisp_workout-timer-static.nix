
{ buildLispPackage, stdenv, fetchurl, lisp-project_workout-timer, 
   lisp_cffi-toolchain, lisp_workout-timer,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-toolchain lisp_workout-timer  ];
      inherit stdenv;
      systemName = "workout-timer/static";
      
      sourceProject = "${lisp-project_workout-timer}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-toolchain} ${lisp_workout-timer}";
      name = "lisp_workout-timer-static-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
