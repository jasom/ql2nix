
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-project-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-project/2016-05-31/cl-project-20160531-git.tgz";
        sha256 = "017197b3792cb2eeb8da39ab7d8ff3848516c84f2c325a626ab6cd7f8b7e92f7";
      };
    }
