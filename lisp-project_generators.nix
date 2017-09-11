
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_generators-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/generators/2013-06-15/generators-20130615-git.tgz";
        sha256 = "6a847032e8f153dcf9871667e1400cc31ee069111333c28ce40eed39e27b2d49";
      };
    }
