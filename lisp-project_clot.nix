
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clot-20150207T211923";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clot/2015-03-02/clot-20150207T211923.tgz";
        sha256 = "0f0b89a6e8bcdc84046c6edd89b862f9833d464b214dc88eafd755c2c0fd9726";
      };
    }
