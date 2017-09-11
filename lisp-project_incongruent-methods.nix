
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_incongruent-methods-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/incongruent-methods/2013-03-12/incongruent-methods-20130312-git.tgz";
        sha256 = "b37ba01bee005beed27b4a9a1297564b3d0f7257357706af19ab0d59b6575cac";
      };
    }
