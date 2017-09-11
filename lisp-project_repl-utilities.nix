
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_repl-utilities-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/repl-utilities/2015-06-08/repl-utilities-20150608-git.tgz";
        sha256 = "8609dac9966e51c837ec3238e6456a5a5072c9d803b118f4b10e4b0a8af6250f";
      };
    }
