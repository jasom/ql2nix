
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_racer-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/racer/2016-09-29/racer-20160929-git.tgz";
        sha256 = "d84c5af9bac71e93c754fe25d324453cd88e03a6d09300801299ff4a18af918b";
      };
    }
