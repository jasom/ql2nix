
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_arrow-macros-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/arrow-macros/2016-09-29/arrow-macros-20160929-git.tgz";
        sha256 = "f1d462a45b3ce1e39b4afd0a6e9cf799da40d7af457fc019d2b6644f60638425";
      };
    }
