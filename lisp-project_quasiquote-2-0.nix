
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quasiquote-2-0-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quasiquote-2.0/2015-05-05/quasiquote-2.0-20150505-git.tgz";
        sha256 = "e424c325ef702b6226f440b9a5df4e38ca4fc49b5ce9ad0ea70b9fcbcfc4ec2d";
      };
    }
