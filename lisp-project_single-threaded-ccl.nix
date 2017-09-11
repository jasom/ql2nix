
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_single-threaded-ccl-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/single-threaded-ccl/2015-06-08/single-threaded-ccl-20150608-git.tgz";
        sha256 = "d00168eeb3df602aeb785211ea48df55a105b831a2ff4b0e50da6ce08d72af83";
      };
    }
