
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_eager-future2-0.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/eager-future2/2011-03-20/eager-future2-0.2.tgz";
        sha256 = "cb8b90dfa0642153d83892d7edc3fd1be6c63e64c96e85a0fd399da481691a2a";
      };
    }
