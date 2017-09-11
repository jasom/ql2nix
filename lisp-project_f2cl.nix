
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_f2cl-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/f2cl/2017-06-30/f2cl-20170630-git.tgz";
        sha256 = "47e2b86fc998b935bfe9a84499220688a657880db6bb48730de5427507566e56";
      };
    }
