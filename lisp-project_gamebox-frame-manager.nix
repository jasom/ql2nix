
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-frame-manager-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-frame-manager/2017-08-30/gamebox-frame-manager-20170830-git.tgz";
        sha256 = "0f4c8182d9f2f97742be035a025f2ed665b6ffc217872a6ff2b2671d098ad3ae";
      };
    }
