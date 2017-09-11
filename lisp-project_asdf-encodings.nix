
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asdf-encodings-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asdf-encodings/2015-06-08/asdf-encodings-20150608-git.tgz";
        sha256 = "9dbc78998d4f5910fd6c0687739ee5a18325a07a80b9b3f8d198ffc190f4f5e8";
      };
    }
