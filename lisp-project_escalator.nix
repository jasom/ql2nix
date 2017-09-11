
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_escalator-20150608-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/escalator/2015-06-08/escalator-20150608-hg.tgz";
        sha256 = "4329e0c8b1de9083b37198c618fbac6dbd3cca45fbfa6921774fe6c1099ad668";
      };
    }
