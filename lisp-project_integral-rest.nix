
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_integral-rest-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/integral-rest/2015-09-23/integral-rest-20150923-git.tgz";
        sha256 = "d2c4e4be3de5cc3242438f913c8208e77998b9af6e3036e009b3419b8c064f91";
      };
    }
