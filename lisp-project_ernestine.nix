
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ernestine-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ernestine/2016-12-04/ernestine-20161204-git.tgz";
        sha256 = "c74402580e50f391d3e21ddb414d2d3283f3af37a23e05bc65f1ee13f0507859";
      };
    }
