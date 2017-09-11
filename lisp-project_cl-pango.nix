
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pango-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pango/2017-04-03/cl-pango-20170403-git.tgz";
        sha256 = "d89f67dcecd61ba20eea52256ddafd8d946ceba3848a378d9980ce2e5ec8fc6e";
      };
    }
