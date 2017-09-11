
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-devil-release-quicklisp-ea5f8514-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.devil/2017-06-30/cepl.devil-release-quicklisp-ea5f8514-git.tgz";
        sha256 = "3375e4c3242ab34a1d557eda25a7daa7f1d80a4b4a7c154c7c234fe850a03939";
      };
    }
