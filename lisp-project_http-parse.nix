
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_http-parse-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/http-parse/2015-06-08/http-parse-20150608-git.tgz";
        sha256 = "03c09c685b279b98a0df500b43cbe0c625eabde4f8a93cdf6463e258cd56101b";
      };
    }
