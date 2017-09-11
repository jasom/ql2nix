
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_misc-extensions-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/misc-extensions/2015-06-08/misc-extensions-20150608-git.tgz";
        sha256 = "1237c8d6da3db6675f09c4be0dfcdffd055365630b547441dd97cb5668887b5e";
      };
    }
