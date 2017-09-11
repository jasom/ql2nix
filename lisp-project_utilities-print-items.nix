
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_utilities-print-items-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/utilities.print-items/2016-09-29/utilities.print-items-20160929-git.tgz";
        sha256 = "f57fef9c51e20ccd30da764838a71e25f0278bc4efe9d0156a0c749955d7acf5";
      };
    }
