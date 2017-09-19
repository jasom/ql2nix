
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-with-quicklisp-2fd8ca54-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-with/2017-08-30/trivial-with-quicklisp-2fd8ca54-git.tgz";
        sha256 = "184a5ab042001c0a9682bd50e1fb8405df939dc2ab4268588c486caf64c226a3";
      };
    }
