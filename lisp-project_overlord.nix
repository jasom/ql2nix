
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_overlord-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/overlord/2017-08-30/overlord-20170830-git.tgz";
        sha256 = "aefc9c36124ac338e8f7c45390a21e38070cfc927661a5181aedfc7d63cffdea";
      };
    }
