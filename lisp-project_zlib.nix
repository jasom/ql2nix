
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zlib-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zlib/2017-04-03/zlib-20170403-git.tgz";
        sha256 = "39fec6b561794a9e8a8fc4e6588f517f2cd6ec4272aa5d836f35ab176dd557df";
      };
    }
