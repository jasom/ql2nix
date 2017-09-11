
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_btrie-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/btrie/2014-07-13/btrie-20140713-git.tgz";
        sha256 = "8e9c07afda35af3ce93af1de953562fcace34f2873ab378ac6911906b4e91d5a";
      };
    }
