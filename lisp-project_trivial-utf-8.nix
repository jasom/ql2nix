
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-utf-8-20111001-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-utf-8/2011-10-01/trivial-utf-8-20111001-darcs.tgz";
        sha256 = "8b17c345da11796663cfd04584445c62f09e789981a83ebefe7970a30b0aafd2";
      };
    }
