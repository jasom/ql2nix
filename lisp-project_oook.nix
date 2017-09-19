
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_oook-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/oook/2017-08-30/oook-20170830-git.tgz";
        sha256 = "65b274b4652282095082ddba5d251b2f27e412f495e8228852409c2dc763b060";
      };
    }
