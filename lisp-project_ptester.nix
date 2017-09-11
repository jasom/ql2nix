
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ptester-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ptester/2016-09-29/ptester-20160929-git.tgz";
        sha256 = "1f8e00bdb514a7a301217fc7a6012542ab81f5806a85516f31ac43497fc03413";
      };
    }
