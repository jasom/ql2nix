
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_check-it-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/check-it/2015-07-09/check-it-20150709-git.tgz";
        sha256 = "8247713ed3677feb1f08469ac3cb65d790af05331ed28b2765870f3a67b3a3af";
      };
    }
