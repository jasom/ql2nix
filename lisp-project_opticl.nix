
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_opticl-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/opticl/2017-06-30/opticl-20170630-git.tgz";
        sha256 = "65b22e991aeac70c20df2dbb763fa3871de578e37b66fea8e733dfb12a868a71";
      };
    }
