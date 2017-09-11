
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sam-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sam/2015-06-08/cl-sam-20150608-git.tgz";
        sha256 = "a6c8f94d1a5431f92b334deff6981544f317c4acc7fce893c0b92b7197d9991b";
      };
    }
