
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-swank-quicklisp-ab90d90f-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-swank/2017-06-30/trivial-swank-quicklisp-ab90d90f-git.tgz";
        sha256 = "2f9fd3000ebfff4d251b8845cd8f1b088b0f1648ba62341963d310a19fd2f04e";
      };
    }
