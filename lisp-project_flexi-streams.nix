
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_flexi-streams-1.0.15";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/flexi-streams/2015-07-09/flexi-streams-1.0.15.tgz";
        sha256 = "f70c76e1724978100e26d9e0e0a0844939cde084b0d7f5623f1adbc8cb187d7e";
      };
    }
