
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clss-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clss/2017-08-30/clss-20170830-git.tgz";
        sha256 = "6796a65af29d47794b62045b96901a6f150f9a8550dea4efc5948e60f1aa1cec";
      };
    }
