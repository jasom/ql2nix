
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_thorn-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/thorn/2015-06-08/thorn-20150608-git.tgz";
        sha256 = "f1b98b13710c6208b06ecd4dc4aa88807e2232801699e9f8d2acd2abb85a1a04";
      };
    }
