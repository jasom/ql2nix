
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_weblocks-stores-20161208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/weblocks-stores/2016-12-08/weblocks-stores-20161208-git.tgz";
        sha256 = "d570e06ea3254418b7992e285d6a66ee54d7069bb37805bc6a8f0e95c447971e";
      };
    }
