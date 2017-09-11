
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-bit-streams-20110320-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-bit-streams/2011-03-20/trivial-bit-streams-20110320-git.tgz";
        sha256 = "cbc735615d3ba925f340121539f808245a1ce1debaba4987a1d6c7d8bebc05d3";
      };
    }
