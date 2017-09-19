
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-azure-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-azure/2016-08-25/cl-azure-20160825-git.tgz";
        sha256 = "25eea824182e7a86e807c76ce032071a0f9a1e16dfa82ff9d34763c0df4d54c0";
      };
    }
