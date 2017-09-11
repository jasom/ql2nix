
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-enchant-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-enchant/2017-02-27/cl-enchant-20170227-git.tgz";
        sha256 = "e04598ea597a80e126ee4b9a828a770c9eeabcafa56f9042aeb2b835ec0be1c2";
      };
    }
