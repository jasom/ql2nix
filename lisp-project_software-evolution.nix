
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_software-evolution-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/software-evolution/2016-09-29/software-evolution-20160929-git.tgz";
        sha256 = "cd469e0a03deae47c083b0fc2eb272ef3c96c89999eab13234665289ef87aa85";
      };
    }
