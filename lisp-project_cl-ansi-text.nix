
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ansi-text-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ansi-text/2015-08-04/cl-ansi-text-20150804-git.tgz";
        sha256 = "51d8cb5872f8b657590cfafaae671f39cf53489d87952598c7485c8f1e3e5c84";
      };
    }
