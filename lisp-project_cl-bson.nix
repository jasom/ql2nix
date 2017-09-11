
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-bson-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-bson/2017-04-03/cl-bson-20170403-git.tgz";
        sha256 = "9eef86e904611c443149d2710ccbdfc1116200660341d5ab6cec029a472fd8eb";
      };
    }
