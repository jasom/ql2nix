
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-weather-jp-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-weather-jp/2016-02-08/cl-weather-jp-20160208-git.tgz";
        sha256 = "1650497d4e1f2dce81df5ffbf9aee98760473210a624b5f26251e0a914c5e1fd";
      };
    }
