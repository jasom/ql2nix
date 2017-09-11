
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_circular-streams-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/circular-streams/2016-12-04/circular-streams-20161204-git.tgz";
        sha256 = "480482d7dfd83d0910b3942c5824cf0ffba84916b24d0a53e945e3c8745a49c4";
      };
    }
