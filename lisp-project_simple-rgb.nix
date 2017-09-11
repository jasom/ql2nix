
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-rgb-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-rgb/2015-04-07/simple-rgb-20150407-git.tgz";
        sha256 = "396db7f40d1334eb4a8068cecbb7a3659c238b1609810c538362fb24d9c1a5e9";
      };
    }
