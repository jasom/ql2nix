
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-exe-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-exe/2015-12-18/trivial-exe-20151218-git.tgz";
        sha256 = "cd435da3e6537b11cf5f40c958f727e91bbc43845f833180854ab5a780699bd1";
      };
    }
