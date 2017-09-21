
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_eco-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/eco/2017-08-30/eco-20170830-git.tgz";
        sha256 = "01db814513fc69d1ccb10b6b0b3bcacd9e104c474598b9aeeb5d1b3f54cec859";
      };
    }