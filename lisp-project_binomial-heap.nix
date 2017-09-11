
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_binomial-heap-20130420-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/binomial-heap/2013-04-20/binomial-heap-20130420-git.tgz";
        sha256 = "5789d780be8027995cd986e2fc3ac0ba764106a686dca832495682a6af30803a";
      };
    }
