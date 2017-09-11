
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_translate-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/translate/2017-06-30/translate-20170630-git.tgz";
        sha256 = "e34b2026f2c565168047507e9aa934b2bb57f347969bcabe60c33d8ca24e4803";
      };
    }
