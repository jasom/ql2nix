
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_stefil-20101107-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/stefil/2010-11-07/stefil-20101107-darcs.tgz";
        sha256 = "e3d3c7e89b55d936a6e0f89ae3d5334093055fed8098e0f9d9f40a7081960135";
      };
    }
