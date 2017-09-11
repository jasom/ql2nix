
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_maiden-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/maiden/2017-07-25/maiden-20170725-git.tgz";
        sha256 = "f95c8dcb1d0554853e57aec7942d92e2bba40f387ae1f9ab51516e7fead46ae1";
      };
    }
