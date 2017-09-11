
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_defmemo-20120407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/defmemo/2012-04-07/defmemo-20120407-git.tgz";
        sha256 = "3a5632d1242e4a4a33be87bdc8d72dc2426f896634bc3260640a6f24851a72e5";
      };
    }
