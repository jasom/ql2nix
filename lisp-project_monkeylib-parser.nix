
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-parser-20120208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-parser/2012-02-08/monkeylib-parser-20120208-git.tgz";
        sha256 = "4345d1b5285f31c87e046cd0f30c58ad9b2181d44b883246532db7a7fe112925";
      };
    }
