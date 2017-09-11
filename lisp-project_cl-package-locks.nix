
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-package-locks-20111203-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-package-locks/2011-12-03/cl-package-locks-20111203-git.tgz";
        sha256 = "45ad46c23b8d956002d34c64d29eec1018755139d64e109c231d78c1f00671db";
      };
    }
