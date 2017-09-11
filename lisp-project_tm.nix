
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_tm-v0.8";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/tm/2017-06-30/tm-v0.8.tgz";
        sha256 = "c81c20f5df8743bf6156ffc7b504473a9dc14928a3aad95e75ac5d0df4e9c15f";
      };
    }
