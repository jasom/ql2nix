
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-autowrap-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-autowrap/2017-08-30/cl-autowrap-20170830-git.tgz";
        sha256 = "2d7fec28316365cffbd02cecf0f121cdb80c7d7aed53dd881044ec8b6ffc9e47";
      };
    }
