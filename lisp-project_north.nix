
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_north-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/north/2017-08-30/north-20170830-git.tgz";
        sha256 = "a6aadb4f5fa39162d7d482565651b10c07fb2fc81017aec83e0d037a56056d63";
      };
    }
