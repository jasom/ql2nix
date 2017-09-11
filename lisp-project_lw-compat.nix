
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lw-compat-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lw-compat/2016-03-18/lw-compat-20160318-git.tgz";
        sha256 = "d814bbf28e04aa65dc932cd4e26f046846739e2566dccab04d3f1df5bae1e582";
      };
    }
