
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_manardb-20101207-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/manardb/2010-12-07/manardb-20101207-git.tgz";
        sha256 = "1b2836b023131b588645fc607a19418555e217c4f7e577a8df07f251b4190f80";
      };
    }
