
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ltk-20150113-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ltk/2015-01-13/ltk-20150113-http.tgz";
        sha256 = "705012a58f2c06df7dd684c4f2ec8dae48144e6fa2e320c5218d36181f69f85f";
      };
    }
