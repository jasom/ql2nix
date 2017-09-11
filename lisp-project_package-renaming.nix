
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_package-renaming-20120407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/package-renaming/2012-04-07/package-renaming-20120407-git.tgz";
        sha256 = "62f9a51f2a9490c668c38887a2a1bccdd793502645c408b9f6bf8c3ad5269fc1";
      };
    }
