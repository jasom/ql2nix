
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_birch-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/birch/2016-03-18/birch-20160318-git.tgz";
        sha256 = "9119d9f702389b53a18eb708cba2b0bc3bf7d37adf741a638b985be31cab0bc7";
      };
    }
