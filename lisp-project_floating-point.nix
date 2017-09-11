
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_floating-point-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/floating-point/2014-11-06/floating-point-20141106-git.tgz";
        sha256 = "dd502fe31cc132a4b0a47ec4a754f5c984a46ca0265062165ca7ad58fda34a35";
      };
    }
