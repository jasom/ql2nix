
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_inferior-shell-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/inferior-shell/2016-09-29/inferior-shell-20160929-git.tgz";
        sha256 = "e0ce85af358674176bd4f8054c97bf2045d891aaaf4baef8277d952816724e08";
      };
    }
