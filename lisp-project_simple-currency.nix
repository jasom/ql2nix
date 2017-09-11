
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-currency-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-currency/2015-03-02/simple-currency-20150302-git.tgz";
        sha256 = "116b596d1bcd45594d2002d5e66cf303ae99be668dabf2e4278a8c17f2dfb7fe";
      };
    }
