
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_type-r-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/type-r/2015-07-09/type-r-20150709-git.tgz";
        sha256 = "7983fcf0a2cf57097135fb96f209e1e633a4eaae005fa1f5350358d78c7a2ae0";
      };
    }
