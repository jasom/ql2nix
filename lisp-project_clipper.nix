
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clipper-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clipper/2015-09-23/clipper-20150923-git.tgz";
        sha256 = "178dd1a87826ee59e341c1dc2a6fff8533ac58d63448e9860f2e6b0a569f7c06";
      };
    }
