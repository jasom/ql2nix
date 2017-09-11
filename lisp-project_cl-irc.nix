
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-irc-0.9.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-irc/2015-09-23/cl-irc-0.9.2.tgz";
        sha256 = "69553d3f5f0382b64cfa1af9428a77d08f2684ba4b15ecddd4481f5275ef2c59";
      };
    }
