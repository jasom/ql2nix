
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-dsl-20130720-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-dsl/2013-07-20/cl-dsl-20130720-git.tgz";
        sha256 = "d62ec882da9c3e4e684ee81ac84224eef1c23a58f016f91743e282d8766c12fc";
      };
    }
