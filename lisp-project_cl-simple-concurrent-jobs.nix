
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-simple-concurrent-jobs-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-simple-concurrent-jobs/2015-05-05/cl-simple-concurrent-jobs-20150505-git.tgz";
        sha256 = "2c113446c587cb17347db2aef6a4e51140b49e7c687fb4a76c5f0f5d6f5a9833";
      };
    }
