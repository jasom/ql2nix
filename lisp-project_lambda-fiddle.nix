
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lambda-fiddle-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lambda-fiddle/2017-06-30/lambda-fiddle-20170630-git.tgz";
        sha256 = "ba9f43f0595d88926cbd00fea1b06320cbf15785b62e0a45d82c03d89b86fe49";
      };
    }
