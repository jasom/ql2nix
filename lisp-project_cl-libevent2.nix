
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-libevent2-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-libevent2/2014-12-17/cl-libevent2-20141217-git.tgz";
        sha256 = "016274f909ea40b867eb2e251ee87e94c8eadb09b51b5a96eddcdaa95de32be5";
      };
    }
