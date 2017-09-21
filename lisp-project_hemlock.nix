
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hemlock-20161208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hemlock/2016-12-08/hemlock-20161208-git.tgz";
        sha256 = "97d4ee133d97a8e2f68214b7312153ff17aae1e4cc38344eca776b08c7c47e0a";
      };
    }
