
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-update-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-update/2017-06-30/trivial-update-20170630-git.tgz";
        sha256 = "849167806c0bf04d4d7203c8a2b3f7e1963b955cd75c8bf5c241ca74d8475006";
      };
    }
