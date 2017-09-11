
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-charms-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-charms/2017-02-27/cl-charms-20170227-git.tgz";
        sha256 = "6ee34e45c72e7eeaa9bbfc51c8cfa193d808e9a046570a54b8a1eb0a3cd83a66";
      };
    }
