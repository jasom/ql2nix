
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glsl-spec-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glsl-spec/2017-06-30/glsl-spec-20170630-git.tgz";
        sha256 = "0b400a8aa4f1a0e8487483b29f008bd1f641b6a1d74acb927465edef4339abc2";
      };
    }
