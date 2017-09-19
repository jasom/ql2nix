
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-math-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-math/2017-08-30/gamebox-math-20170830-git.tgz";
        sha256 = "84b7a5f38b79c4dc23bff17afd67e08fbe866be6be574501dc1c33bcd185755b";
      };
    }
