
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zsort-20120520-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zsort/2012-05-20/zsort-20120520-git.tgz";
        sha256 = "81af0e77efd3183f581d7cca7ae59a349b22cb278668000ad57feda81009242e";
      };
    }
