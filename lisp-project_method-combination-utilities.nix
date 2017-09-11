
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_method-combination-utilities-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/method-combination-utilities/2014-11-06/method-combination-utilities-20141106-git.tgz";
        sha256 = "1a63ed8e26f5f4af3c800c30600a0de206edefa3adc4fd95d30579c0102c7e91";
      };
    }
