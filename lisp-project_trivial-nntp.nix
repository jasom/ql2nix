
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-nntp-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-nntp/2016-12-04/trivial-nntp-20161204-git.tgz";
        sha256 = "bf16c012737f8cc3500dc4e9ed01b86960e0b179e53ef5cdd900767e16fd9fc1";
      };
    }
