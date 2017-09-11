
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_closure-common-20101107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/closure-common/2010-11-07/closure-common-20101107-git.tgz";
        sha256 = "64c2b19fd64be8606f8208191b3269022e8fe34abe3f72acfd349f2fec6d02a5";
      };
    }
