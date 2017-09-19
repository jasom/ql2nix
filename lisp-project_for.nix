
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_for-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/for/2017-08-30/for-20170830-git.tgz";
        sha256 = "2c5ee08a2add23f38f9b42d5401a2f56cfeeeef918ad430a22570f36f4758b00";
      };
    }
