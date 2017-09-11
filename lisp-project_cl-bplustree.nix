
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-bplustree-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-bplustree/2013-03-12/cl-bplustree-20130312-git.tgz";
        sha256 = "3fc37e204fcf23bf2bf6c201efa2c7bdbfd37c7984a4badec27138c3ecb91673";
      };
    }
