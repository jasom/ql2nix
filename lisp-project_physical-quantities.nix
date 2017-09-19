
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_physical-quantities-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/physical-quantities/2017-08-30/physical-quantities-20170830-git.tgz";
        sha256 = "5e0c260ef435a4be38cae95cf38df55a1c8266510c292cdee305fc2f7e75e39d";
      };
    }
