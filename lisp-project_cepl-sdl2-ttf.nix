
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-sdl2-ttf-release-quicklisp-4232bef8-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.sdl2-ttf/2017-06-30/cepl.sdl2-ttf-release-quicklisp-4232bef8-git.tgz";
        sha256 = "bcc2cb3a503a9d9ff937fd9b125c853409d45a775d405fe81a4436a08165c404";
      };
    }
