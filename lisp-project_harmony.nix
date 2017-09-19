
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_harmony-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/harmony/2017-08-30/harmony-20170830-git.tgz";
        sha256 = "d7d393125c7ffd01dc55467821f0063f462c3d9d3ba9592170b5fb37072c31cf";
      };
    }
