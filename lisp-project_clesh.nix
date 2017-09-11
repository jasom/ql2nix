
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clesh-20120208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clesh/2012-02-08/clesh-20120208-git.tgz";
        sha256 = "0ce6466fcbe480cfefdedb705b9f207735a9e551f6b33efd11c6b19a7ec761ae";
      };
    }
