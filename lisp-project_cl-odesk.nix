
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-odesk-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-odesk/2015-06-08/cl-odesk-20150608-git.tgz";
        sha256 = "0c1e32a6d374e67107b12c418d1306328e9dfeb6cf8ecbc3ead8c59d3fd747fa";
      };
    }
