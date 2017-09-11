
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-irc-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-irc/2015-08-04/trivial-irc-20150804-git.tgz";
        sha256 = "8c6bcd4e7b14e98252ee13eb0f2b693fd1b5bd30c87e6aab1e7e679f0741f575";
      };
    }
