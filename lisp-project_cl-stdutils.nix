
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-stdutils-20111001-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-stdutils/2011-10-01/cl-stdutils-20111001-git.tgz";
        sha256 = "feb18e5ab27aa010acec3e338722595bbfa3b591cb949671cd35696b08bac3da";
      };
    }
