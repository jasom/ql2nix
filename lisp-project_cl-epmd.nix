
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-epmd-20140211-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-epmd/2014-02-11/cl-epmd-20140211-git.tgz";
        sha256 = "b1552158f7327b860904d84fddaa4cbb93bb10dc9561a0cb11de3bb17371125c";
      };
    }
