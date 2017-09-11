
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_local-package-aliases-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/local-package-aliases/2013-03-12/local-package-aliases-20130312-git.tgz";
        sha256 = "040ea1b640617eb09997771990d6fb2f1a0b8556fa87d011ea18a518e9b15b98";
      };
    }
