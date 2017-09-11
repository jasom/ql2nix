
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rock-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rock/2015-06-08/rock-20150608-git.tgz";
        sha256 = "7051ad0195b0fcc845deafe660f6ae76de8857bccdb6497fa136123b98375a0c";
      };
    }
