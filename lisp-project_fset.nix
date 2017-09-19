
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fset-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fset/2017-08-30/fset-20170830-git.tgz";
        sha256 = "31276c7892c6dd5673526213c425c589948a4396067aaee9dc150a882b5f1954";
      };
    }
