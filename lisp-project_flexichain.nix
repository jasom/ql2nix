
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_flexichain_1.5.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/flexichain/2010-10-06/flexichain_1.5.1.tgz";
        sha256 = "cd16ad66cb8496d01b2e2b8ce4717535b628d74a7867b2af2a4c51cb58c24535";
      };
    }
