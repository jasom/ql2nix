
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sclf-20150207T213551";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sclf/2015-03-02/sclf-20150207T213551.tgz";
        sha256 = "7f4590275704a6e783c722ddcc9699769ba4b79fc8b1e45b24c61563f6c4359d";
      };
    }
