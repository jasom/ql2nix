
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_agnostic-lizard-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/agnostic-lizard/2017-04-03/agnostic-lizard-20170403-git.tgz";
        sha256 = "c7ea6416451c76d9b71fc70894640c441cc2591d69cac739cc3cd494cebb87b1";
      };
    }
