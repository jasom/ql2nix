
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lack-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lack/2017-07-25/lack-20170725-git.tgz";
        sha256 = "77c9731b05df2741fb24a0bfb5f183215410aa510328aaf41743d41f94a7bdb0";
      };
    }
