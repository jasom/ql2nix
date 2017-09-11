
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-frame-manager-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-frame-manager/2017-07-25/gamebox-frame-manager-20170725-git.tgz";
        sha256 = "53b94022885e66ea8d0b2730f4c8567c6a7f4f04a85017ff1b6100cff596961e";
      };
    }
