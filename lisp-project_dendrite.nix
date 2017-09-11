
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dendrite-release-quicklisp-662aedba-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dendrite/2017-06-30/dendrite-release-quicklisp-662aedba-git.tgz";
        sha256 = "c5c1fbae5417c1abe0d41c4db1fbed924df77d0139cf18d659c7cf067201b1de";
      };
    }
