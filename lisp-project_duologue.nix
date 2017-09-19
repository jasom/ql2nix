
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_duologue-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/duologue/2015-04-07/duologue-20150407-git.tgz";
        sha256 = "13eaab315b5755e250ed708016e0642f1c3dec3d461a0701762bde67d5e9dca1";
      };
    }
