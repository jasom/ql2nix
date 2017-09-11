
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_macro-html-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/macro-html/2015-12-18/macro-html-20151218-git.tgz";
        sha256 = "2a5076b609242975a63346b34054094e5a070f5ebdaac7f7cb4a41ceb18596f7";
      };
    }
