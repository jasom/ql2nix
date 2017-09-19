
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_laap-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/laap/2017-08-30/laap-20170830-git.tgz";
        sha256 = "4cf8b3d500800e0556036b4dc6d4fa486f448d2df2df7dca597a65af853985ba";
      };
    }
