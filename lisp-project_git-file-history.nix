
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_git-file-history-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/git-file-history/2016-08-25/git-file-history-20160825-git.tgz";
        sha256 = "68f47b5869b4eed29d7a47299029ce9d6eded9127d085b39d761ca481c5b8e0b";
      };
    }
