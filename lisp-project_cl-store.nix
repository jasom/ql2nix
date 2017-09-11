
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-store-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-store/2016-05-31/cl-store-20160531-git.tgz";
        sha256 = "5f52ae5b6d0a6b898031ce60c5ce8d9424a5e16be2eb8ecc82871afff7733748";
      };
    }
