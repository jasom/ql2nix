
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_descriptions-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/descriptions/2015-03-02/descriptions-20150302-git.tgz";
        sha256 = "af79befd95fab37ec8dd622dc0affb40ab4c448cf0bf57d52603e669f840ff34";
      };
    }
