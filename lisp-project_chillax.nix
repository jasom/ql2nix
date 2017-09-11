
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chillax-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chillax/2015-03-02/chillax-20150302-git.tgz";
        sha256 = "bdbb626b77cda8501e6570d60b63611f81858b8c4624bc6d7462a5974e1521d2";
      };
    }
