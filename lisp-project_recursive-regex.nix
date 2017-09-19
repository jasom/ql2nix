
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_recursive-regex-20120407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/recursive-regex/2012-04-07/recursive-regex-20120407-git.tgz";
        sha256 = "2a0c1c95e4382ce2f3ad3f9a084f058ff73a7adc97bb92f2507abf6fe63f210c";
      };
    }
