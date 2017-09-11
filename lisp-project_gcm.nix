
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gcm-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gcm/2014-12-17/gcm-20141217-git.tgz";
        sha256 = "02faf41bdd243bfbd9376144fc4330603b514a3188590dde7df38b36644e89f6";
      };
    }
