
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_s-sysdeps-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/s-sysdeps/2013-01-28/s-sysdeps-20130128-git.tgz";
        sha256 = "007841d3117892a3c519b4e88959cb67aff34933039cbd1741a2daeb7f051811";
      };
    }
