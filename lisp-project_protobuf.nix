
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_protobuf-20161208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/protobuf/2016-12-08/protobuf-20161208-git.tgz";
        sha256 = "110d927dad68b24ee8663b6a6d88b542845f3866b085ca237b8c22c5a8f6beca";
      };
    }
