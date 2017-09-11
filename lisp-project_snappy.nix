
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_snappy-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/snappy/2015-10-31/snappy-20151031-git.tgz";
        sha256 = "f92bdc3feb43235d524633e732a8b07e84dbcf954af5691f28a8895a14d72400";
      };
    }
