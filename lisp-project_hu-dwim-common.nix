
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-common-20150709-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.common/2015-07-09/hu.dwim.common-20150709-darcs.tgz";
        sha256 = "17aeefbbc68f58a8f9367f2254d8824edaa850d9d0b05716e029d5c44dce818a";
      };
    }
