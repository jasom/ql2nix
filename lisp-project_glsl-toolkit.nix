
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glsl-toolkit-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glsl-toolkit/2017-08-30/glsl-toolkit-20170830-git.tgz";
        sha256 = "bf3392c538d32b30d40220a25c3b62775e8dbd7bbc9a0219fbcabc87427ac679";
      };
    }
