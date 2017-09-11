
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_map-bind-20120811-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/map-bind/2012-08-11/map-bind-20120811-git.tgz";
        sha256 = "23e5075998b068c1de1f92b507c41f22fe692be6caf1adb0d391d65472e0f5ef";
      };
    }
