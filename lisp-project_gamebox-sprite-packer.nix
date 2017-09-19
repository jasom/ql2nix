
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-sprite-packer-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-sprite-packer/2017-08-30/gamebox-sprite-packer-20170830-git.tgz";
        sha256 = "b764e97e1ff5f249c86a9fefdc4acdabc5286391cff922ac29f3460e8b42435f";
      };
    }
