
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fast-http-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fast-http/2017-06-30/fast-http-20170630-git.tgz";
        sha256 = "49c8a7f727f9c7b73c728c1b2509c6d75a95598d5f2f69fd40472586f9e2783a";
      };
    }
