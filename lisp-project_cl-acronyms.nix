
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-acronyms-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-acronyms/2015-03-02/cl-acronyms-20150302-git.tgz";
        sha256 = "ef3de8d42a0cca56e6eea79b68996478ecee8027226d448c7302a6ea0a4bdf4d";
      };
    }
