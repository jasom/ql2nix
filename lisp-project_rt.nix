
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rt-20101006-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rt/2010-10-06/rt-20101006-git.tgz";
        sha256 = "3b280c5c10ad44efee1f1ac226e3d1ffed1d131a9636c1b247134fde4156ccca";
      };
    }
