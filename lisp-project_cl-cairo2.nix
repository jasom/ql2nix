
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cairo2-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cairo2/2016-05-31/cl-cairo2-20160531-git.tgz";
        sha256 = "fd0d0a4465d27d351f3bfd52d456edfee9893c5eb6359f33b326097fa7022b73";
      };
    }
