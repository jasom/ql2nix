
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chipz-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chipz/2016-03-18/chipz-20160318-git.tgz";
        sha256 = "4620842f94c9431379e9e7e4f27c46381e1730fb1a2c187b39600ed2267afab6";
      };
    }
