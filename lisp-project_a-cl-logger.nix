
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_a-cl-logger-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/a-cl-logger/2017-02-27/a-cl-logger-20170227-git.tgz";
        sha256 = "7618ba695a5910e3a03aafc8071fa7f28bf249d346ecaacd2ab2dce252601ba1";
      };
    }
