
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_doubly-linked-list-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/doubly-linked-list/2017-08-30/doubly-linked-list-20170830-git.tgz";
        sha256 = "46de0955ab3ccc3e9657aaeea69d94c2f8ddd8d347ae235438ef2d014256c062";
      };
    }
