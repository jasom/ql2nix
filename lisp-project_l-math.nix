
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_l-math-20131111-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/l-math/2013-11-11/l-math-20131111-git.tgz";
        sha256 = "46ef84a0d6eb784f73b4357ed4f8f6b33d3e504f123ab4d94abb367507164504";
      };
    }
