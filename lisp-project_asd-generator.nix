
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asd-generator-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asd-generator/2017-08-30/asd-generator-20170830-git.tgz";
        sha256 = "8b40de651313f4248f6059b4034773a9103076abad587a67cd29b071c9f601c1";
      };
    }
