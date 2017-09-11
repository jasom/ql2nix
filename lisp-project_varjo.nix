
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_varjo-release-quicklisp-525a7693-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/varjo/2017-06-30/varjo-release-quicklisp-525a7693-git.tgz";
        sha256 = "7ff58ab90cb51e2ea9e55ec5d10c2cbc2bc8cf023ad96e5d85bdd68535a476e3";
      };
    }
