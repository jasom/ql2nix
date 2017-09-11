
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_json-responses-20151031-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/json-responses/2015-10-31/json-responses-20151031-hg.tgz";
        sha256 = "3ca992917b6ec09922232b4cccec3da1767c7df6a02b5539a9926c6041cf53b7";
      };
    }
