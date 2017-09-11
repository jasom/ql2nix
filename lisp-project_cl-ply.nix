
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ply-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ply/2015-05-05/cl-ply-20150505-git.tgz";
        sha256 = "a14975943e45c11a2c4489bb0ff998a300a6c1d63ba056dc1915fdad9591de48";
      };
    }
