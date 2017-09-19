
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_flare-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/flare/2017-08-30/flare-20170830-git.tgz";
        sha256 = "c40914abf36f478d6989575450d8685b38ef5928a6d10398f2ec7988178e9e47";
      };
    }
