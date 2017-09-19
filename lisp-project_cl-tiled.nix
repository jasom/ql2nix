
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tiled-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tiled/2017-08-30/cl-tiled-20170830-git.tgz";
        sha256 = "c98cb194b927f2d4a780ef2d70ea68c405ac32709c38fdd7673e9eeac91685e9";
      };
    }
