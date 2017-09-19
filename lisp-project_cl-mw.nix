
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mw-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mw/2015-04-07/cl-mw-20150407-git.tgz";
        sha256 = "fe399b8010c6f0b82dbd550257a5e7bc68dbf6370c06bd1a8a90735c743020e1";
      };
    }
