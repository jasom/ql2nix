
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_css-lite-20120407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/css-lite/2012-04-07/css-lite-20120407-git.tgz";
        sha256 = "0f07477a7dc7e324a6b8db90c8292f176951567a104f9f608fc653d815c6c1bd";
      };
    }
