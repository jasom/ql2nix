
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-autorepo-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-autorepo/2017-04-03/cl-autorepo-20170403-git.tgz";
        sha256 = "0212c9cb3b9e4d6418864e1a1f5d636ebe7c5e77d04907d506f26a0cabb6ff6c";
      };
    }
