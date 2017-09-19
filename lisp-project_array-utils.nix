
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_array-utils-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/array-utils/2017-08-30/array-utils-20170830-git.tgz";
        sha256 = "307ecf7ef03f383e53a3752ef808c08cd7443eab72f76939d9bce02d2adf3a5c";
      };
    }
