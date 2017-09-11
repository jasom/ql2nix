
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_let-plus-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/let-plus/2017-01-24/let-plus-20170124-git.tgz";
        sha256 = "2876647aa772f9e80fbe03b2047d41de48995539633ed3a9f88c6d331ee1dac1";
      };
    }
