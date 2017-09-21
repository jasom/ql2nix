
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_swank-crew-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/swank-crew/2015-10-31/swank-crew-20151031-git.tgz";
        sha256 = "d13b31510a3c20086678fb8a9859bafc76b56e1f67a857579084cdafbecef958";
      };
    }
