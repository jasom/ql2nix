
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_omer-count-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/omer-count/2017-06-30/omer-count-20170630-git.tgz";
        sha256 = "a4666961a756d432fa59f422c1a68952308e494bc309e448b23c6347d079441c";
      };
    }
