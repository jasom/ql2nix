
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_wuwei-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/wuwei/2017-02-27/wuwei-20170227-git.tgz";
        sha256 = "47f9007dab1bd6ff9147dfaf643a2d0b58465a50d6113c718da2a90bfbedc435";
      };
    }
