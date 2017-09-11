
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mpg123-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mpg123/2017-06-30/cl-mpg123-20170630-git.tgz";
        sha256 = "81eabf1680b6673639df2eb976f2ee275c67f8e1d135b4d64178e80aaa247e7a";
      };
    }
