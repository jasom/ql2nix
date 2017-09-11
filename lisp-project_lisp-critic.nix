
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisp-critic-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisp-critic/2016-10-31/lisp-critic-20161031-git.tgz";
        sha256 = "b7dac915f62f1639dbe04d670df1b5665fc584f1dd945eb9591692e64f12925e";
      };
    }
