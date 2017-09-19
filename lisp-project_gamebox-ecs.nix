
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-ecs-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-ecs/2017-08-30/gamebox-ecs-20170830-git.tgz";
        sha256 = "dda93cbe228a515ebc6269f15f18a80dfadf26ea6a103cf8a761cc4db5f96682";
      };
    }
