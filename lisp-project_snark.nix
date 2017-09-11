
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_snark-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/snark/2016-04-21/snark-20160421-git.tgz";
        sha256 = "1bde083ab32941093345277eea56665adccdde626cffca81bd524df6b84d7ecb";
      };
    }
