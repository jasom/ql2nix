
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-kanren-trs-20120305-svn";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-kanren-trs/2012-03-05/cl-kanren-trs-20120305-svn.tgz";
        sha256 = "578506160053da05d4dd61fe6aefd60ce6007ae71a50e66cb78efc19d78cb62c";
      };
    }
