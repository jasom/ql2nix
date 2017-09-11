
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_track-best-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/track-best/2013-06-15/track-best-20130615-git.tgz";
        sha256 = "ea8dd91b601420e579130336a7bb0c9b9b6602dcc55a3a2c02e303ef1c2ec6ed";
      };
    }
