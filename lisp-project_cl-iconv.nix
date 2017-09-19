
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-iconv-20131111-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-iconv/2013-11-11/cl-iconv-20131111-git.tgz";
        sha256 = "c2f28aab4885d24cad06760e78f80ab3337f031c221ac65b2bbe5840003c6fb8";
      };
    }
