
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_extended-reals-20121013-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/extended-reals/2012-10-13/extended-reals-20121013-git.tgz";
        sha256 = "e2fe74760f0b66b119ab8b2f69377ee6e17276a08077b86bee3f2caac1aeb8a2";
      };
    }
