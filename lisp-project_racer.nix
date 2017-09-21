
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_racer-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/racer/2017-08-30/racer-20170830-git.tgz";
        sha256 = "6c841031eb03a901ee3341859dabdedbe19535ad27cd69bf5f08e6acfa9a18c3";
      };
    }
