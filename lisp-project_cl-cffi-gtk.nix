
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cffi-gtk-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cffi-gtk/2016-02-08/cl-cffi-gtk-20160208-git.tgz";
        sha256 = "f5f02a3794bb67a9799a3215e9a508c2effac2b111d59746c02cfd58e3ad99ea";
      };
    }
