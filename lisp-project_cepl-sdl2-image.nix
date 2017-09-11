
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-sdl2-image-release-quicklisp-94a77649-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.sdl2-image/2017-06-30/cepl.sdl2-image-release-quicklisp-94a77649-git.tgz";
        sha256 = "d1af287e1b86667090a27492ab1c7baaf9f66bba35fff7561f9f162ac6024f26";
      };
    }
