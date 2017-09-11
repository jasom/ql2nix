
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_marching-cubes-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/marching-cubes/2015-07-09/marching-cubes-20150709-git.tgz";
        sha256 = "30118876cdfb0ab01c5f3b3596687600e093304b3e577a1bf305439b79a88263";
      };
    }
