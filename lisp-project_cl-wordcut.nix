
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-wordcut-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-wordcut/2016-04-21/cl-wordcut-20160421-git.tgz";
        sha256 = "cab3328cac69ee07f5e638d03fd8a4260ef619cc6d4216b19bbbd1d0c31bf9b7";
      };
    }
