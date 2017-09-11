
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clump-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clump/2016-08-25/clump-20160825-git.tgz";
        sha256 = "342f197960fff1aa3c38d15d9d8011c39fd8fe54e44e186d14255e3a79edcfd6";
      };
    }
