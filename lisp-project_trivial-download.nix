
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-download-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-download/2015-12-18/trivial-download-20151218-git.tgz";
        sha256 = "dc452cc4b1f0c98bb6a52ed56948c9454a2f19b594c19c5a2ed60ba34c4354a0";
      };
    }
