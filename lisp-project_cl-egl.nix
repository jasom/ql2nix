
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-egl-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-egl/2016-10-31/cl-egl-20161031-git.tgz";
        sha256 = "2e0956ea1454a65d62fe6acfa5289a3e262005f141a72df703479ce0466d3264";
      };
    }
