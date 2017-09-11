
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_nineveh-release-quicklisp-fd995883-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/nineveh/2017-06-30/nineveh-release-quicklisp-fd995883-git.tgz";
        sha256 = "d589dcc213f5b7e43e424f57b942c55d08cba126f8bd068b9b06c4a6849e7ff5";
      };
    }
