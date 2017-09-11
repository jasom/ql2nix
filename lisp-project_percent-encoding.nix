
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_percent-encoding-20121013-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/percent-encoding/2012-10-13/percent-encoding-20121013-git.tgz";
        sha256 = "cbc1a53c8b710ab8d82f2d4bec80e0e622574102bb7e67e06941c118d8398eb6";
      };
    }
