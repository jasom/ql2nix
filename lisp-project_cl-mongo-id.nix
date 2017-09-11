
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mongo-id-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mongo-id/2015-07-09/cl-mongo-id-20150709-git.tgz";
        sha256 = "14239d8d5752b5e66d16b5afd1de5750786b73f11389baf8d385fe2ac1d2924b";
      };
    }
