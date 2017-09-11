
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_png-read-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/png-read/2017-06-30/png-read-20170630-git.tgz";
        sha256 = "b329bad73f41ca6e8e5986d3f1513413d1567317d26300345227da9fd0de171f";
      };
    }
