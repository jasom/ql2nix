
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ningle-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ningle/2017-08-30/ningle-20170830-git.tgz";
        sha256 = "876f0fc4bd119ed8fcec008bde8db9ebd60dc2aa9e9aa2a8228a4586857f2c9e";
      };
    }
