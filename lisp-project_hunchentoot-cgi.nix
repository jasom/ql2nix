
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hunchentoot-cgi-20140211-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hunchentoot-cgi/2014-02-11/hunchentoot-cgi-20140211-git.tgz";
        sha256 = "cc96c587c2a74ae81f6d6fff920284a6709163de056e600d1503a1901679c2f7";
      };
    }
