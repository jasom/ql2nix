
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-string-match-20160421-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-string-match/2016-04-21/cl-string-match-20160421-hg.tgz";
        sha256 = "ac4435281865746a518be3c1be312ff586d556d5e9b7b029687fc8c137beaeb4";
      };
    }
