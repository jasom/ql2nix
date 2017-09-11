
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_jpl-queues-0.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/jpl-queues/2010-10-06/jpl-queues-0.1.tgz";
        sha256 = "264173a84cf385d08ccdc0e8a3714722ca4aa0232f48850551099e10e4d97bf3";
      };
    }
