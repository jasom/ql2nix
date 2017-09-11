
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parachute-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parachute/2017-06-30/parachute-20170630-git.tgz";
        sha256 = "042945213eb589c00a3bd13e76a18389b50b78e45092bc7981fb3257aeb774f9";
      };
    }
