
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-octet-streams-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-octet-streams/2013-01-28/trivial-octet-streams-20130128-git.tgz";
        sha256 = "f41d71bd98757b95a452331173b93d4e0162d842d5f2ad62bf82102444535c45";
      };
    }
