
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_translate-client-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/translate-client/2017-06-30/translate-client-20170630-git.tgz";
        sha256 = "1b729465a6a117e8c23f69dcc1b56a36e6f42af0a4e5fb48e38933e9180c03ef";
      };
    }
