
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clx-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clx/2017-08-30/clx-20170830-git.tgz";
        sha256 = "9e15d59678804b18abf3b769a3ac268b946c4b22985a666e822a0df6daad73c9";
      };
    }
