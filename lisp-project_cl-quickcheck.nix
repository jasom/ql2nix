
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-quickcheck-20161208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-quickcheck/2016-12-08/cl-quickcheck-20161208-git.tgz";
        sha256 = "a8d6015514bec009cb397dad1e9b46a05f6aa10eab509f497eb4b9eb27e6eaa9";
      };
    }
