
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bytecurry-asdf-ext-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bytecurry.asdf-ext/2015-05-05/bytecurry.asdf-ext-20150505-git.tgz";
        sha256 = "e8ab98eef869be032de0993912b2e3814a797e96cdd6c9134d46814950db5a1a";
      };
    }
