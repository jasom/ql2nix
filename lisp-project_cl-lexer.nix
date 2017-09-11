
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-lexer-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-lexer/2016-04-21/cl-lexer-20160421-git.tgz";
        sha256 = "d397379e4af8b7c14f940e0959f790f228ad9b12cf97e27fddd98f0356e89744";
      };
    }
