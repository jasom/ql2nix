
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mgl-20161208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mgl/2016-12-08/mgl-20161208-git.tgz";
        sha256 = "98e04d268f9899afd3db06648e925f6e5cee965f54788dd11d9848ef8686469a";
      };
    }
