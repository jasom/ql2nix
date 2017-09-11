
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_readable-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/readable/2015-06-08/readable-20150608-git.tgz";
        sha256 = "e3c1020f9d716051403cb41cea67e4e410d44bb740e0820f709e5ce8b943f561";
      };
    }
