
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_positional-lambda-2.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/positional-lambda/2012-10-13/positional-lambda-2.0.tgz";
        sha256 = "0306187dcc73efc6239019227448f38bb30af7537d6fdc41718412165b7d20ec";
      };
    }
