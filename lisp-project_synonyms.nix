
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_synonyms-20120811-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/synonyms/2012-08-11/synonyms-20120811-hg.tgz";
        sha256 = "e1afb1eb98f6c43eb01fb7e95e7d554616c9bb5bd3de252a615afdd88787d46f";
      };
    }
