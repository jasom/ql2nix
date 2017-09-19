
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_carrier-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/carrier/2016-12-04/carrier-20161204-git.tgz";
        sha256 = "98b5838874b202156d0d7fa6e384b4967d0c55631ed5d510b506d6c6576d1d8d";
      };
    }
