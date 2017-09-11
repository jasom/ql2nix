
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_odd-streams-0.1.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/odd-streams/2013-01-28/odd-streams-0.1.2.tgz";
        sha256 = "eee0c0fa08e2a2f175e96eceee79298564a6d27efec47e08d4d362a2c15ddd25";
      };
    }
