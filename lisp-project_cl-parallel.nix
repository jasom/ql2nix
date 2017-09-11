
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-parallel-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-parallel/2013-03-12/cl-parallel-20130312-git.tgz";
        sha256 = "f5cc72b6d9d53451c1a0034d5fdbfceffeaff5a249fbc7e24a3ce9ae8b6108fe";
      };
    }
