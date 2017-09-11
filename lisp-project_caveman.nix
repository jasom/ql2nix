
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_caveman-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/caveman/2017-06-30/caveman-20170630-git.tgz";
        sha256 = "424ec9b3d0913d9873fa5df9b8de6bd575762df683e4f592c5fbe5cda6b6f272";
      };
    }
