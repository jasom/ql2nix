
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-kanren-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-kanren/2017-07-25/cl-kanren-20170725-git.tgz";
        sha256 = "12594eeb28483270175b801f23013a0138ed11ebf76a0c7a7e3b44208de98190";
      };
    }
