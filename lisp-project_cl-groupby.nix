
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-groupby-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-groupby/2015-12-18/cl-groupby-20151218-git.tgz";
        sha256 = "206f8c212c80f67b5cc1f09ad997a8b9079877b42979ecfdec21ad1095f4de0f";
      };
    }
