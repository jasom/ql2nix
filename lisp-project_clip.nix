
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clip-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clip/2017-08-30/clip-20170830-git.tgz";
        sha256 = "e664e2fb94a0ac505b5e5cf455d6a33c3c2cbd29a14933ce9e3984db1326a600";
      };
    }
