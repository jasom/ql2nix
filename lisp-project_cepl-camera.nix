
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-camera-release-quicklisp-1292212a-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.camera/2017-06-30/cepl.camera-release-quicklisp-1292212a-git.tgz";
        sha256 = "11a931c444363b4e27fec37dca102370336e048daf31c56de9c92bf1fdb00d53";
      };
    }
