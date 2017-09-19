
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tidy-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tidy/2017-08-30/cl-tidy-20170830-git.tgz";
        sha256 = "84b496f4277ba47cc73d458f73ac30d3f5f2b0b82b68d408cfbc9e348fc08d65";
      };
    }
