
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gendl-devo-0272a167-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gendl/2016-12-04/gendl-devo-0272a167-git.tgz";
        sha256 = "4fdb384747a90cacbc3edfa4f6ff413ddaf4ca5b10d974d669abfb542f48ff28";
      };
    }
