
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-text-output-20111203-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-text-output/2011-12-03/monkeylib-text-output-20111203-git.tgz";
        sha256 = "1da25c2be0e92f3f4281a7f86b0a15d72104dea16218bd2479d4986099835f65";
      };
    }
