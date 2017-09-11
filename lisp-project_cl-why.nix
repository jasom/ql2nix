
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-why-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-why/2017-06-30/cl-why-20170630-git.tgz";
        sha256 = "bff08a3b0bc9b4f5b50fc9a8acf7d415c9d058e66e0bd56b7f590265d7b4df88";
      };
    }
