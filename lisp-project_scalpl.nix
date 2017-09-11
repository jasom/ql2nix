
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_scalpl-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/scalpl/2017-06-30/scalpl-20170630-git.tgz";
        sha256 = "e377aa7a5ff4e11bef33a4b93b19dc8bf412b782ab341767e4400a01a4f0bcd8";
      };
    }
