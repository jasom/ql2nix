
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plump-bundle-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plump-bundle/2017-08-30/plump-bundle-20170830-git.tgz";
        sha256 = "4ece0f9c8035ff9e1dae5457fd0c633335820317e247c3437dbbef8d0162a350";
      };
    }
