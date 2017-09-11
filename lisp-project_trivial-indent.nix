
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-indent-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-indent/2017-06-30/trivial-indent-20170630-git.tgz";
        sha256 = "07dbecf9dd1ca520415a54ffe1460c627c8a301323a06a4d1f5d3a2fec79eaa3";
      };
    }
