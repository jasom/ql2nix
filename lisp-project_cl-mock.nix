
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mock-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mock/2016-04-21/cl-mock-20160421-git.tgz";
        sha256 = "7bc123d49a0029d7de9d3f506df21d5258dbad909a5d9f13caf106bedb6a290d";
      };
    }
