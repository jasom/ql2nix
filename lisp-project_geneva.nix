
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_geneva-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/geneva/2016-12-04/geneva-20161204-git.tgz";
        sha256 = "15c6e85253a3b90776933023e9ae67f83a4da4bd87381a914110cf96991a3185";
      };
    }
