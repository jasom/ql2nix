
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_swank-live-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/swank.live/2016-02-08/swank.live-20160208-git.tgz";
        sha256 = "b8d84f11a07bdb0268f3c62d213038fb54bbdb3ff59f1825edf09040aeca6c85";
      };
    }
