
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-text-languages-20111203-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-text-languages/2011-12-03/monkeylib-text-languages-20111203-git.tgz";
        sha256 = "80a68ed44c8ac24c7757bcf921b4de8c4cb72a81cb4ba207c4f2be513b8b5515";
      };
    }
