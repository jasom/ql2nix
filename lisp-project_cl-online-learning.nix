
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-online-learning-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-online-learning/2017-04-03/cl-online-learning-20170403-git.tgz";
        sha256 = "324a51c27c5e0abafa7eed53ed70ff39fda04ae97efe52ec9502d750dbb51808";
      };
    }
