
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_easing-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/easing/2017-06-30/easing-20170630-git.tgz";
        sha256 = "236b2ff2111e9b84ce0397398e8c6a42a8ac1e3623d0efb1c532618804bd4212";
      };
    }
