
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-zmq-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-zmq/2016-03-18/cl-zmq-20160318-git.tgz";
        sha256 = "cf7921dd08e106b3004084b2171d244594556b1af271c1f26d26f1251118c082";
      };
    }
