
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pithy-xml-20101006-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pithy-xml/2010-10-06/pithy-xml-20101006-git.tgz";
        sha256 = "c096ae16534a87d71f278b6ddb2585b152e003001c8b939c29e5afe4977dd623";
      };
    }
