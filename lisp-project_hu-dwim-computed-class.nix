
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-computed-class-20161204-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.computed-class/2016-12-04/hu.dwim.computed-class-20161204-darcs.tgz";
        sha256 = "4192feb08b63b129f6642cb25dfeac2bdd5f683cfb59960450154df03ecc60ff";
      };
    }
