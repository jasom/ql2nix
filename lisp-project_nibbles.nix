
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_nibbles-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/nibbles/2017-04-03/nibbles-20170403-git.tgz";
        sha256 = "64d232bc15c6c6a31d66e09c868c6df901aa41d9f20531ffad7854882197e72d";
      };
    }
