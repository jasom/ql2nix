
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_shorty-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/shorty/2017-08-30/shorty-20170830-git.tgz";
        sha256 = "fd9b1278cb108791db09f0b8e59759cc8975316059f2a0e48a98ce1e512c79b6";
      };
    }
