
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rectangle-packing-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rectangle-packing/2013-06-15/rectangle-packing-20130615-git.tgz";
        sha256 = "1e3d8844707eb61a7c817831729e0f595ce4360ab37929cf42d58a2380345bd5";
      };
    }
