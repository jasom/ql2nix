
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-slp-20140826-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-slp/2014-08-26/cl-slp-20140826-git.tgz";
        sha256 = "2d8708cbf20cab843a4e9b030387bceaba8f00ad12bba1daeaf8487f46509af7";
      };
    }
