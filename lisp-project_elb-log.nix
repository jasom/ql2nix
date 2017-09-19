
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_elb-log-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/elb-log/2015-09-23/elb-log-20150923-git.tgz";
        sha256 = "a0e991dc87166f289ff4dd0a8e5e226313893ecbfae51d7d4f9bb68d8d51143d";
      };
    }
