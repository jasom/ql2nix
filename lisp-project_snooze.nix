
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_snooze-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/snooze/2016-10-31/snooze-20161031-git.tgz";
        sha256 = "562219bad212f0f5b62ff11e4862b9d449ac71d5906456b41a4359947acf1a9b";
      };
    }
