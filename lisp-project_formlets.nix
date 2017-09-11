
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_formlets-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/formlets/2016-12-04/formlets-20161204-git.tgz";
        sha256 = "1e232d620d54e07d0a054899f297e24a6629f25748ed834e316aaaa035ead69f";
      };
    }
