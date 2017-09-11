
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fs-watcher-20130813-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fs-watcher/2013-08-13/fs-watcher-20130813-git.tgz";
        sha256 = "0d0a5f2f20152fbcd277d6302c6ad377926f79b781550f14ce25cb87eb0e707b";
      };
    }
