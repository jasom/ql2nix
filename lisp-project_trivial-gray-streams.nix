
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-gray-streams-20140826-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-gray-streams/2014-08-26/trivial-gray-streams-20140826-git.tgz";
        sha256 = "22757737e6b63a21f5e7f44980df8047f8c8294c290eeaaaf01bef1f31b80bda";
      };
    }
