
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-durian-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-durian/2015-06-08/cl-durian-20150608-git.tgz";
        sha256 = "f41a1a33fb0db31d88c07a334af4c42b91e725e11d6d103e77c9468897659add";
      };
    }
