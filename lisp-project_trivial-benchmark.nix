
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-benchmark-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-benchmark/2017-06-30/trivial-benchmark-20170630-git.tgz";
        sha256 = "75cc8da7d6b924c69d1712ebd0a7af4cb709f21db7eecbd6b70680e23d57b2ed";
      };
    }
