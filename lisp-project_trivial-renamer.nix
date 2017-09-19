
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-renamer-quicklisp-1282597d-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-renamer/2017-08-30/trivial-renamer-quicklisp-1282597d-git.tgz";
        sha256 = "fb2479121dce605262869c0309396bd18883f8302a19f02e5836a9b3cf31371e";
      };
    }
