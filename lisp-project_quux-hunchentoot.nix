
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quux-hunchentoot-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quux-hunchentoot/2017-08-30/quux-hunchentoot-20170830-git.tgz";
        sha256 = "22d5695f2bf815ed8b8c0fe6b5574a17007a9c30b1817bbd07d3db89280a2427";
      };
    }
