
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivia-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivia/2017-07-25/trivia-20170725-git.tgz";
        sha256 = "fbff6ada5a0a3bc62b21d935ecb1b97ed2cd7ac5cf342a57ccb0005f7e8e5d38";
      };
    }
