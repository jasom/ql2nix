
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ie3fp-20101006-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ie3fp/2010-10-06/ie3fp-20101006-http.tgz";
        sha256 = "f09f9d9d52f3833c9f093b3b90ea7f5e67c14a6dcfe426ef271e2a813667b8a3";
      };
    }
