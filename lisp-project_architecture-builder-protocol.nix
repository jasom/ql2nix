
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_architecture-builder-protocol-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/architecture.builder-protocol/2017-06-30/architecture.builder-protocol-20170630-git.tgz";
        sha256 = "833035403545b5f217ed80c7f32541b4f1656f8ad6f09c566908a4680529cafa";
      };
    }
