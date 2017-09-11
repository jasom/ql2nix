
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_cl-xkb-20170630-git.library.patch];
      name = "lisp-project_cl-xkb-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-xkb/2017-06-30/cl-xkb-20170630-git.tgz";
        sha256 = "b6a0648f3fa85ef070f92f9e780be4586fdae466afebf9fb3e2a796a558ea94a";
      };
    }
