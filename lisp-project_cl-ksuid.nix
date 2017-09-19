
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ksuid-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ksuid/2017-08-30/cl-ksuid-20170830-git.tgz";
        sha256 = "7889f51e63b087791883b1781e97264cf05afdaa5871bca93a621d81d9c3d344";
      };
    }
