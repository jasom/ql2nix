
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_big-string-20130615-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/big-string/2013-06-15/big-string-20130615-hg.tgz";
        sha256 = "0a1d4463211a0b4c98be69cd932e3b8f362352aaaff436c6638c4567cda54f88";
      };
    }
