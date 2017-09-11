
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-scan-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-scan/2016-10-31/cl-scan-20161031-git.tgz";
        sha256 = "dd7c0bfde7bd8e9d7fb03bfd638910a7153a62510d18dc119585627b5d2f12b1";
      };
    }
