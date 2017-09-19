
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-arxiv-api-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-arxiv-api/2017-04-03/cl-arxiv-api-20170403-git.tgz";
        sha256 = "4f1c1cc8684b3e0c9da117e6b29595bf8d4b52afb2029cd099f2a92e938fc743";
      };
    }
