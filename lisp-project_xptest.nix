
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xptest-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xptest/2015-09-23/xptest-20150923-git.tgz";
        sha256 = "1352f80289e392b4a574cf5d052fda4e38f58ae3d79e9f8f39656b7a80fc6b5a";
      };
    }
