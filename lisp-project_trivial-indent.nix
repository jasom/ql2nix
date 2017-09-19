
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-indent-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-indent/2017-08-30/trivial-indent-20170830-git.tgz";
        sha256 = "2da2b318099ea656c7d20ec1dcc890b30b0dbdc0b39ce55bf82660751784f3d4";
      };
    }
