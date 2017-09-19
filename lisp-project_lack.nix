
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lack-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lack/2017-08-30/lack-20170830-git.tgz";
        sha256 = "b9e0af3db13b41c4881f1ecdce3156e8d795076854a496aa33d7d1e448f34e23";
      };
    }
