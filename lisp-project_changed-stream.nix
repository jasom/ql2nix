
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_changed-stream-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/changed-stream/2013-01-28/changed-stream-20130128-git.tgz";
        sha256 = "17baf5d7d872d8e41973494c2b663306e19b5f94f551fded9708dfa934618c6f";
      };
    }
