
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-vectors-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-vectors/2017-06-30/cl-vectors-20170630-git.tgz";
        sha256 = "801c1acf64a67c86064e97b0350e821b54a8134dfd8c8bf34006dd6b22c74020";
      };
    }
