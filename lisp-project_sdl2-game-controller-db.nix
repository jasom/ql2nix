
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sdl2-game-controller-db-release-quicklisp-335d2b68-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sdl2-game-controller-db/2017-06-30/sdl2-game-controller-db-release-quicklisp-335d2b68-git.tgz";
        sha256 = "39deee798cfd7635a950aba259525f0128c6f55c96e32d9896fc288892079124";
      };
    }
