
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-str-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-str/2017-08-30/cl-str-20170830-git.tgz";
        sha256 = "ca67761dcd579bc93aa9fca184a69d502615fbfdde0f9dc114ae32ec3e75f438";
      };
    }
