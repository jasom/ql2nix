
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sdl2kit-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sdl2kit/2017-06-30/sdl2kit-20170630-git.tgz";
        sha256 = "627427bae462b21592f3411b5bba79bed86bac05557ec10591d1c8ea7c05cca5";
      };
    }
