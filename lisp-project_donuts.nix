
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_donuts-20120703-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/donuts/2012-07-03/donuts-20120703-git.tgz";
        sha256 = "a0f2825a9704bb7209ae1d5cba2a02a6ea2669ba67fd09969183e23566d386e2";
      };
    }
