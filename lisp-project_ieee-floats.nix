
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ieee-floats-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ieee-floats/2017-08-30/ieee-floats-20170830-git.tgz";
        sha256 = "137bc5b3385c35101a6440112757df46570395cdaeed4bf11648353638c18495";
      };
    }
