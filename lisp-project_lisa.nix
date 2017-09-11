
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisa-20120407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisa/2012-04-07/lisa-20120407-git.tgz";
        sha256 = "79d488e98bd1588934dbd0a9580b039175916c0b08a833ed7409c426d9eed236";
      };
    }
