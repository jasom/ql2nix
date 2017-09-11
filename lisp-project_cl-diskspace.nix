
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-diskspace-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-diskspace/2017-06-30/cl-diskspace-20170630-git.tgz";
        sha256 = "ff2b40a1741001bfdef692100a0e124ceadb940a0a500b5c02f24a8c90fe2d1c";
      };
    }
