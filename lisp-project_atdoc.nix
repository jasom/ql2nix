
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_atdoc-20120305-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/atdoc/2012-03-05/atdoc-20120305-git.tgz";
        sha256 = "314314859bed0567a9846f12bec62b62b36add5b606afc070fbe390368783583";
      };
    }
