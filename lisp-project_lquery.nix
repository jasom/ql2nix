
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lquery-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lquery/2017-06-30/lquery-20170630-git.tgz";
        sha256 = "557e7df5fa5726024afeffe8a4889682379d3fd66da3b382e1348cd7a2fc97a6";
      };
    }
