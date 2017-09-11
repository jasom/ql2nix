
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_stl-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/stl/2016-12-04/stl-20161204-git.tgz";
        sha256 = "25661f37183cf9ba3eb4147645ec7fa25b7c15487240603f81bc532c31817394";
      };
    }
