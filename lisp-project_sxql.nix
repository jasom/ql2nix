
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sxql-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sxql/2017-01-24/sxql-20170124-git.tgz";
        sha256 = "71f4ac02702b866d63c6c0a972c1a19c9232e7f0f3573d7e29c7e7a0671961ea";
      };
    }
