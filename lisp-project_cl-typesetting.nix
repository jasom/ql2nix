
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-typesetting-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-typesetting/2017-08-30/cl-typesetting-20170830-git.tgz";
        sha256 = "e31b54aeeae2a26e1474f65ff6b6d51cf9df68031e671fe590f1cf8805c86dd6";
      };
    }
