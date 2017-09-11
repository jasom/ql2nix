
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clx-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clx/2017-06-30/clx-20170630-git.tgz";
        sha256 = "e72e198aa6faec7a54241e3cc57201a5ac8a30511c63307c7dd44baade802836";
      };
    }
