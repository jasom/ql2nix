
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-ecs-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-ecs/2017-07-25/gamebox-ecs-20170725-git.tgz";
        sha256 = "1726012f9ee4877bc55b0a23147c6eda5e6f07e71e31b722416ca339f3b7011c";
      };
    }
