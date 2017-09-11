
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-annot-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-annot/2015-06-08/cl-annot-20150608-git.tgz";
        sha256 = "e3b54b0d395aec3b0d83c37460443feaf08587bd71c73836bc28919981b8ba47";
      };
    }
