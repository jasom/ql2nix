
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-moss-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-moss/2017-08-30/cl-moss-20170830-git.tgz";
        sha256 = "61ae54239fb38ca407a3e15081d196a0a2445ee378ae139539a64e3dc4395ca3";
      };
    }
