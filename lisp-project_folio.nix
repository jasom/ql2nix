
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_folio-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/folio/2013-01-28/folio-20130128-git.tgz";
        sha256 = "826e17829cbf1fdf8fd20e774034766333607a039fedd07c3dc3fb0c19ebd50f";
      };
    }
