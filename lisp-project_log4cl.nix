
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_log4cl-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/log4cl/2017-06-30/log4cl-20170630-git.tgz";
        sha256 = "598831a8903d617a9b15edeccd6e7dacd615865d57014766203958248e88c1d8";
      };
    }
