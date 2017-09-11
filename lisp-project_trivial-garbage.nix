
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-garbage-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-garbage/2015-01-13/trivial-garbage-20150113-git.tgz";
        sha256 = "08c0a03595843576835086dc5973cfb535f75f77de4b90e9c9b97c7eba97c1fb";
      };
    }
