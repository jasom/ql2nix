
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-grids-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-grids/2017-08-30/gamebox-grids-20170830-git.tgz";
        sha256 = "28f6eeb28e0a22e4b666c329d28235a6993215978227c708383ec0538d66256e";
      };
    }
