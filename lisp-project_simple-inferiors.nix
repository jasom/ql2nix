
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-inferiors-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-inferiors/2017-08-30/simple-inferiors-20170830-git.tgz";
        sha256 = "25e1fc754972e093733510e4fd9fabb3f7880a7dbd5e5b590be9f4d959ce004b";
      };
    }
