
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_colliflower-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/colliflower/2015-12-18/colliflower-20151218-git.tgz";
        sha256 = "c75fed7c577f5d452247b58c0877a732c59ce5382f9670e7740474fdc275f745";
      };
    }
