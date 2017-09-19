
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xlsx-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xlsx/2017-08-30/xlsx-20170830-git.tgz";
        sha256 = "2fd0e6895932794c8201816b05a9876b079cc31f76c39c142bb10b7a83eccc53";
      };
    }
