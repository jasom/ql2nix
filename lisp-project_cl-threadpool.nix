
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-threadpool-quickload-current-release-67b33ca4-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-threadpool/2017-06-30/cl-threadpool-quickload-current-release-67b33ca4-git.tgz";
        sha256 = "8530a60a55c0897c7c97e7da8cb68667171ceb84710e52c47da0f71d1fbf4e4a";
      };
    }
