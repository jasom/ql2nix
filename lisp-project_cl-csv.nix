
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-csv-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-csv/2017-04-03/cl-csv-20170403-git.tgz";
        sha256 = "d0f88b2b973a1ae252b4f429c3be41e2de5897ea1fabd57e0bbcfb934186e0d7";
      };
    }
