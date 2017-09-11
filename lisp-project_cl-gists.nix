
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gists-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gists/2017-06-30/cl-gists-20170630-git.tgz";
        sha256 = "37caab90f48d597f56d800e37d56f3496dc7135549a0faf5c122f85f2ac1cd68";
      };
    }
