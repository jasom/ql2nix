
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_3bgl-shader-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/3bgl-shader/2017-07-25/3bgl-shader-20170725-git.tgz";
        sha256 = "e3f5a9eb230ecfaba2e93e84defbfeded6db4ce5daabddf16a4a39ba841726e3";
      };
    }
