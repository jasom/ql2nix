
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parenml-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parenml/2015-09-23/parenml-20150923-git.tgz";
        sha256 = "a1c86f02306039185f6d3cb1f3ce4ef1fb68ed2dcb1be748c115a5f2893d685a";
      };
    }
