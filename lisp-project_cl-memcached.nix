
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-memcached-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-memcached/2015-06-08/cl-memcached-20150608-git.tgz";
        sha256 = "f5729cb586b27f642fb945703f9c54c471e9afce5b8b0914ad80f30dbde393ff";
      };
    }
