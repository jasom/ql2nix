
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-escapes-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-escapes/2017-02-27/trivial-escapes-20170227-git.tgz";
        sha256 = "310d2677eec17bf211d3f84a12c2ae61b075ac9d82b9a2306a272051fa88cc91";
      };
    }
