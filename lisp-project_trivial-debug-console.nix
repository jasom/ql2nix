
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-debug-console-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-debug-console/2015-04-07/trivial-debug-console-20150407-git.tgz";
        sha256 = "bf84090324fd74a4352ce622b2cb2ef58721620bd340e915d880bf2b306bc7b0";
      };
    }
