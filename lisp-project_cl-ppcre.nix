
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ppcre-2.0.11";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ppcre/2015-09-23/cl-ppcre-2.0.11.tgz";
        sha256 = "626d4e1f78659d0b6e4d675c94e39afb1f602427724c961b1e4f029b348f4cb6";
      };
    }
