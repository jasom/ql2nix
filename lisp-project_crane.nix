
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_crane-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/crane/2016-02-08/crane-20160208-git.tgz";
        sha256 = "f8e34858ee312fb55ece93b28ddfbed7b850a94c80759f5150f17cb977897bbc";
      };
    }
