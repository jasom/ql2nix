
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_3bmd-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/3bmd/2016-12-04/3bmd-20161204-git.tgz";
        sha256 = "fdfadf8ff390d2ad85300328d87b6386d4e215c9afe28c67bd31a96c70f51995";
      };
    }
