
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_verbose-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/verbose/2017-06-30/verbose-20170630-git.tgz";
        sha256 = "79f0328a8ff9b37f4beca14816813c8ad7dbf0139b9546b6526c012ea974b1d1";
      };
    }
