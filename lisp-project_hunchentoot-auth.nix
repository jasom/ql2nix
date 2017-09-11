
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hunchentoot-auth-20140113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hunchentoot-auth/2014-01-13/hunchentoot-auth-20140113-git.tgz";
        sha256 = "563666d039d2c3906791f5d5fd3f375ba0f26ea9a478aac88666530b2b376d22";
      };
    }
