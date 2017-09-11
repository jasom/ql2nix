
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hunchentoot-single-signon-20131111-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hunchentoot-single-signon/2013-11-11/hunchentoot-single-signon-20131111-git.tgz";
        sha256 = "ed837dbd8cb2beb9958ce2bf237298ab7df64dd080755870f6b637479a154251";
      };
    }
