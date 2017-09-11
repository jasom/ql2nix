
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_defmacro-enhance-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/defmacro-enhance/2017-04-03/defmacro-enhance-20170403-git.tgz";
        sha256 = "7e827d8917df03882263d2221a4b0e42f11505786c591f2370ec7b9c3659f9ec";
      };
    }
