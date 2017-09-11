
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_telnetlib-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/telnetlib/2014-12-17/telnetlib-20141217-git.tgz";
        sha256 = "6a5d2c70b3d8e3301ae18ab8d0e84c10009c59ce619c50ccb1565c5d1853a197";
      };
    }
