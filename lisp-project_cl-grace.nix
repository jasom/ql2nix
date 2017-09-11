
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-grace-20160825-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-grace/2016-08-25/cl-grace-20160825-hg.tgz";
        sha256 = "fb870acc3374bd055a70ed9f5f5695a036ec60f02ede4aab9c59a47fc6c3410d";
      };
    }
