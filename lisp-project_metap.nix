
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_metap-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/metap/2015-05-05/metap-20150505-git.tgz";
        sha256 = "6874d02d573767d6351e1c11e7b81694035993772b315617c6475401272ff9bd";
      };
    }
