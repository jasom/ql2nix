
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_documentation-utils-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/documentation-utils/2017-08-30/documentation-utils-20170830-git.tgz";
        sha256 = "7b1f73892efba5595a236a86e689ca125c16f6aed98ba249f49e2fd86a8f9cb4";
      };
    }
