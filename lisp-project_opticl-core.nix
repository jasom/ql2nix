
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_opticl-core-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/opticl-core/2017-02-27/opticl-core-20170227-git.tgz";
        sha256 = "e3e6f345b134c8bfe80ca3111e9e970938a4fa50b8442ddfc194effdd45ffe8c";
      };
    }
