
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ca-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ca/2016-12-04/cl-ca-20161204-git.tgz";
        sha256 = "d552ddd5c3dad0fcee13b3992fafb57e26f3807c50553cf1bbfc06670181387d";
      };
    }
