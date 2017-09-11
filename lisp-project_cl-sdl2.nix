
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sdl2-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sdl2/2017-06-30/cl-sdl2-20170630-git.tgz";
        sha256 = "e90ce01dbbfaac8632c71cdd259129b2ea3540ba7b6170a90d94395a8abf2375";
      };
    }
